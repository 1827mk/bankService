<%@ page contentType="text/html; charset=windows-874" %>

<%@ page import="java.sql.*"%>
<%@ include file="config.jsp"%> 
<!--��ҹ bean ��С�˹�������Ѻ bean -->
<jsp:useBean id="book" class="g.FormBook" scope="page" />
<jsp:setProperty name="book" property="*" />
<%!//���ʹ�����ʺѭ����ǧ˹��
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
//���ҧ��������§�Ѻ�ҹ������
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql;ResultSet rs=null;
String maxB_id="";
//�����ʺѭ������ش
sql="select  max(b_id) as maxB_id from bookbank";
rs=stmt.executeQuery(sql);
if(rs.next()){
maxB_id=rs.getString("maxB_id");
}else{
maxB_id="00000000";
}
rs.close();
//��Ǩ�ͺ����ա�á����������ѭ���������
if(request.getParameter("Submit")!=null){
//��Ǩ�ͺ��Ҩҡ��������������� bean �բ�ͼԴ��Ҵ������� ��������Ӣ�ͼԴ��Ҵ�͡���ʴ�
if(book.isErrors()){
showEr(book.getErrors(),out);
}else{
//�������բ�ͼԴ��Ҵ ��Ǩ�ͺ��Ҫ��ͺѭ�ի��������� 
sql="select * from bookbank where b_id='"+book.getB_id()+"'";
rs=stmt.executeQuery(sql);
//��ҫ���ʴ���ͤ�����͹
if(rs.next()){ //rs.close();
Vector er=new Vector();
er.add("���ʺѭ���������ö�����");
showEr(er,out);
}else{
//�������� ��������ѭ������
sql="insert into bookbank values('"+book.getB_id()+"','"+book.getBt_id()+"','"+book.getName()+"','"+book.getNd_rent()+"','"+book.getM_rent()+"','"+book.getM_pay()+"','"+book.getPriv()+"',1)";
int rows=stmt.executeUpdate(sql);
if(rows!=0){
response.sendRedirect("book.jsp");
}
}
}
}else{
//����ѧ����顴���������ѭ�� ����Ҥ�ҷ�����㹵��ҧ b_type ������ rs ���͹���ʴ�㹿���� List ��������ѭ��
sql="select * from b_type";
rs=stmt.executeQuery(sql);
%>
<!-- ����������ѭ�� -->
<form method="post" action="add_book.jsp">
<table width="60%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="black">
  <tr>
    <td bgcolor="#CCCCCC"><div align="center"><strong>ŧ����¹�ѭ������ ��������ش [ <%=maxB_id%> ] </strong></div></td>
  </tr>
  <tr>
    <td bgcolor="#ECE9D8">
      <br>
      <table width="95%"  border="0" align="center">
        <tr>
          <td width="29%">���� �ѭ��</td>
          <td width="71%">
            <input name="b_id" type="text" value="<%=getNewB_id(maxB_id)%>" size="10" maxlength="8">
        * (����Ţ 8 ��ѡ) </td>
        </tr>
        <tr>
          <td>�������ѭ��</td>
          <td><select name="bt_id">
            <option value="0" selected>���͡�������ѭ��</option>
            <% //�ʴ��������ѭ�շ������� rs
				while(rs.next()){%>
			<option value="<%=rs.getString("bt_id")%>"><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></option>
				 <%}rs.close();%>
            </select>
        *</td>
        </tr>
        <tr>
          <td>���ͺѭ��</td>
          <td><input name="name" type="text">
        *</td>
        </tr>
        <tr>
          <td><div align="center">
                <p align="left"> �ӹǹ�ѭ�շ����<br>
        </p>
                </div></td>
          <td><input name="nd_rent" type="text" size="3" maxlength="3">            
            *</td>
        </tr>
        <tr>
          <td>�ӹǹ�Թ�ҡ</td>
          <td><input name="m_rent" type="text" size="6" maxlength="6">
            *</td>
        </tr>
        <tr>
          <td> ����</td>
          <td><input name="m_pay" type="text" size="6" maxlength="6">
            *</td>
        </tr>
        <tr>
          <td>�Է��㹡�÷Ӹ�á���</td>
          <td><input name="priv" type="radio" value="2" checked>
            ������
              <input name="priv" type="radio" value="1">
੾�� VIP</td>
        </tr>
        <tr>
          <td colspan="2"><div align="center">
              <input name="n_rent" type="hidden" value="0">
              <input type="submit" name="Submit" value="�����ѭ��">
              <input name="Reset" type="reset" value="��¹����">
          </div></td>
        </tr>
      </table>
    </td>
  </tr>
</table></form>
<%}%>