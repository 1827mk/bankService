<%@ page contentType="text/html; charset=windows-874" %>

<%@ page import="java.sql.*"%>
<%@ include file="config.jsp"%> 
<!--ใช้งาน bean และกำหนดค่าให้กับ bean -->
<jsp:useBean id="book" class="g.FormBook" scope="page" />
<jsp:setProperty name="book" property="*" />
<%!//เมธอดหารหัสบัญชีล่วงหน้า
public  String getNewB_id(String mb){
String temp=""+(Integer.parseInt(mb)+1);
String newB_id;
switch(temp.length()){
case 1: newB_id="0000000"+temp;break;
case 2: newB_id="000000"+temp;break;
case 3: newB_id="00000"+temp;break;
case 4: newB_id="0000"+temp;break;
case 5: newB_id="000"+temp;break;
case 6: newB_id="00"+temp;break;
case 7: newB_id="0"+temp;break;
default : newB_id=temp;
}
return newB_id;
}
%>
<%
//สร้างการเชือมโยงกับฐานข้อมูล
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql;ResultSet rs=null;
String maxB_id="";
//หารหัสบัญชีล่าสุด
sql="select  max(b_id) as maxB_id from bookbank";
rs=stmt.executeQuery(sql);
if(rs.next()){
maxB_id=rs.getString("maxB_id");
}else{
maxB_id="00000000";
}
rs.close();
//ตรวจสอบว่ามีการกดปุ่มเพิ่มบัญชีหรือไม่
if(request.getParameter("Submit")!=null){
//ตรวจสอบค่าจากฟอร์มที่ส่งเข้าไปใน bean มีข้อผิดพลาดหรือไม่ ถ้ามีให้นำข้อผิดพลาดออกมาแสดง
if(book.isErrors()){
showEr(book.getErrors(),out);
}else{
//ถ้าไม่มีข้อผิดพลาด ตรวจสอบว่าชื่อบัญชีซ้ำหรือไม่ 
sql="select * from bookbank where b_id='"+book.getB_id()+"'";
rs=stmt.executeQuery(sql);
//ถ้าซ้ำแสดงข้อความเตือน
if(rs.next()){ //rs.close();
Vector er=new Vector();
er.add("รหัสบัญชีไม่สามารถซ้ำได้");
showEr(er,out);
}else{
//ถ้าไม่ซ้ำ ให้เพิ่มบัญชีใหม่
sql="insert into bookbank values('"+book.getB_id()+"','"+book.getBt_id()+"','"+book.getName()+"','"+book.getNd_rent()+"','"+book.getM_rent()+"','"+book.getM_pay()+"','"+book.getPriv()+"',1)";
int rows=stmt.executeUpdate(sql);
if(rows!=0){
response.sendRedirect("book.jsp");
}
}
}
}else{
//ถ้ายังไม่ได้กดปุ่มเพิ่มบัญชี ให้หาค่าทั้งหมดในตาราง b_type เก็บไว้ใน rs เพื่อนำไปแสดงในฟอร์ม List ประเำภทบัญชี
sql="select * from b_type";
rs=stmt.executeQuery(sql);
%>
<!-- ฟอร์มเพิ่มบัญชี -->
<form method="post" action="add_book.jsp">
<table width="60%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="black">
  <tr>
    <td bgcolor="#CCCCCC"><div align="center"><strong>ลงทะเบียนบัญชีใหม่ รหัสล่าสุด [ <%=maxB_id%> ] </strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8">
      <br>
      <table width="95%"  border="0" align="center">
        <tr>
          <td width="29%">รหัส บัญชี</td>
          <td width="71%">
            <input name="b_id" type="text" value="<%=getNewB_id(maxB_id)%>" size="10" maxlength="8">
        * (ตัวเลข 8 หลัก) </td>
        </tr>
        <tr>
          <td>ประเภทบัญชี</td>
          <td><select name="bt_id">
            <option value="0" selected>เลือกประเภทบัญชี</option>
            <% //แสดงประเภทบัญชีที่อยู่ใน rs
				while(rs.next()){%>
			<option value="<%=rs.getString("bt_id")%>"><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></option>
				 <%}rs.close();%>
            </select>
        *</td>
        </tr>
        <tr>
          <td>ชื่อบัญชี</td>
          <td><input name="name" type="text">
        *</td>
        </tr>
        <tr>
          <td><div align="center">
                <p align="left"> จำนวนบัญชีที่มี<br>
        </p>
                </div></td>
          <td><input name="nd_rent" type="text" size="3" maxlength="3">            
            *</td>
        </tr>
        <tr>
          <td>จำนวนเงินฝาก</td>
          <td><input name="m_rent" type="text" size="6" maxlength="6">
            *</td>
        </tr>
        <tr>
          <td> อื่นๆ</td>
          <td><input name="m_pay" type="text" size="6" maxlength="6">
            *</td>
        </tr>
        <tr>
          <td>สิทธิในการทำธุรกรรม</td>
          <td><input name="priv" type="radio" value="2" checked>
            ทั้งหมด
              <input name="priv" type="radio" value="1">
เฉพาะ VIP</td>
        </tr>
        <tr>
          <td colspan="2"><div align="center">
              <input name="n_rent" type="hidden" value="0">
              <input type="submit" name="Submit" value="เพิ่มบัญชี">
              <input name="Reset" type="reset" value="เขียนใหม่">
          </div></td>
        </tr>
      </table>
    </td>
  </tr>
</table></form>
<%}%>