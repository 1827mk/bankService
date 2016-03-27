<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*"%>
<%@ page import ="java.util.*" %>
<%@ include file="config.jsp"%> 
<%
//สร้างการติดต่อกับฐานข้อมูล
String b_id=request.getParameter("b_id");
String old_id=request.getParameter("old_id");
String bt_id,name,nd_rent,m_rent,m_pay,priv;
bt_id=name=nd_rent=m_rent=m_pay=priv="";
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql;ResultSet rs;
Vector errors=new Vector();
//ตรวจสอบว่ามีการกดปุ่มแก้ไขหรือไม่
if(request.getParameter("Submit")!=null){
bt_id=request.getParameter("bt_id");
name=request.getParameter("name");
nd_rent=request.getParameter("nd_rent");
m_rent=request.getParameter("m_rent");
m_pay=request.getParameter("m_pay");
priv=request.getParameter("priv");
//ตรวจสอบว่ารหัสหนังสือซ้ำหรือไม่
if(!b_id.equals(old_id)){
sql="select b_id from bookbank where b_id='"+b_id+"'";
rs=stmt.executeQuery(sql);
if(rs.next()){
errors.add("รหัสหนังสือมีอยู่แล้ว");
}
}
if((ckNumeric(b_id))||(b_id.length()!=8)){
errors.add("ตรวจสอบ รหัสหนังสือ");
}
if(name.equals("")){
errors.add("ตรวจสอบ ชื่อประเภทสมาชิก");
}
if(bt_id.equals("0")||ckNumeric(bt_id)){
errors.add("ตรวจสอบ ประเภทหนังสือ");
}
if(ckNumeric(m_rent)){
errors.add("ตรวจสอบ ค่าเช่า");
}
if(ckNumeric(m_pay)){
errors.add("ตรวจสอบ ค่าปรับ/วัน");
}
//ตรวจสอบว่าค่าใน bean มีข้อผิดพลาดหรือไม่ถ้ามีแสดงข้อผิดพลาด
if(errors.size()>0){
showEr(errors,out);
}else{ 
//ถ้าไม่มีข้อผิดพลาดให้ทำ query แก้ไขตาราง book
sql="update bookbank set b_id='"+b_id+"',bt_id='"+bt_id+"',name='"+name+"',numbank='"+nd_rent+"',balance='"+m_rent+"',other='"+m_pay+"',priv='"+priv+"' where b_id="+old_id;
int rows=stmt.executeUpdate(sql);
if(rows!=0){
response.sendRedirect("book.jsp");
}
}
}else{
//ถ้ายังไม่ได้กดปุ่ม แก้ไขให้ทำ query เพื่อหาค่าจากตาราง  book
sql="select * from bookbank where b_id='"+b_id+"'";
rs=stmt.executeQuery(sql);
while(rs.next()){
//นำผลที่หาได้เพิ่มเข้าไปในตัวแปร
bt_id=rs.getString("bt_id");
name=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874");
nd_rent=rs.getString("numbank");
m_rent=rs.getString("balance");
m_pay=rs.getString("other");
priv=rs.getString("priv");
}
rs.close();
sql="select * from b_type";
rs=stmt.executeQuery(sql);
%>
<!--ฟอร์มแก้ไขหนังสือ-->
<form method="post" action="edit_book.jsp">
<table width="60%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="black">
  <tr>
    <td bgcolor="#CCCCCC"><div align="center"><strong>แก้ไขหนังสือ</strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8">
        <br>
        <table width="95%"  border="0" align="center">
          <tr>
            <td width="29%">รหัสหนังสือ</td>
            <td width="71%">
              <input name="b_id" type="text" value="<%=b_id%>" size="10" maxlength="8">
* (ตัวเลข 8 หลัก) </td>
          </tr>
          <tr>
            <td>ประเภทหนังสือ</td>
            <td><select name="bt_id">
                <option value="0" >เลือกประเภทหนังสือ</option>
                <%while(rs.next()){%>
                <option value="<%=rs.getString("bt_id")%>" <%if(bt_id.equals(rs.getString("bt_id"))){out.println("selected");}%> ><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></option>
                <%}rs.close();%>
              </select>
              *</td>
          </tr>
          <tr>
            <td>ชื่อหนังสือ</td>
            <td><input name="name" type="text" value="<%=name%>">
              *</td>
          </tr>
          <tr>
            <td><div align="center">
                <p align="left"> จำนวนวันให้เช่า <br>
                </p>
            </div></td>
            <td><input name="nd_rent" type="text" value="<%=nd_rent%>" size="3" maxlength="3">
              *</td>
          </tr>
          <tr>
            <td>ค่าเช่า</td>
            <td><input name="m_rent" type="text" value="<%=m_rent%>" size="6" maxlength="6">
              *</td>
          </tr>
          <tr>
            <td>ค่าปรับ/วัน</td>
            <td><input name="m_pay" type="text" value="<%=m_pay%>" size="6" maxlength="6">
              *</td>
          </tr>
          <tr>
            <td>สิทธิในการยืม</td>
            <td>
			<input name="priv" type="radio" value="2"<%if(priv.equals("2")){%> checked<%}%>>
              ทั้งหมด
                <input name="priv" type="radio" value="1"<%if(priv.equals("1")){%> checked<%}%>>
              เฉพาะ VIP</td>
          </tr>
          <tr>
            <td colspan="2"><div align="center">
                <input name="old_id" type="hidden" value="<%=b_id%>">
                <input type="submit" name="Submit" value="  แก้ไข  ">
                <input name="Reset" type="reset" value="เขียนใหม่">
            </div></td>
          </tr>
        </table>
    </td>
  </tr>
</table></form>
<%}%>