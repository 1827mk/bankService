<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*"%>
<%@ include file="config.jsp"%> 
<%
//�Դ��͡Ѻ�ҹ������ �������͡��ҷ������ҡ���ҧ book
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql="select * from bookbank order by b_id";
ResultSet rs=stmt.executeQuery(sql);
%> 
<center><b><a href="bank.jsp">ŧ����¹�ѭ������</a></b></center><br>

<center><b><a href="bank.jsp">��Ѻ˹���á</a></b></center><br>




<!--�ʴ���������´˹ѧ��͵�ҧ�, ���������§��� ���ź -->
  <table width="60%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="black">
  <tr bgcolor="#CCCCCC">
    <td width="21%"><b>���ʺѭ��</b></td>
    <td width="67%"><b>����</b></td>
    <td width="5%"><b>ź</b></td>
    <td width="7%"><b>���</b></td>
  </tr>
  <%while(rs.next()){%>
  <tr bgcolor="#ECE9D8">
    <td><%=rs.getString("b_id")%></td>
    <td><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></td>
    <td><a href='del_book.jsp?b_id=<%=rs.getString("b_id")%>'>ź</a></td>
    <td><a href='edit_book.jsp?b_id=<%=rs.getString("b_id")%>'>���</a></td>
  </tr>
  <%} %>
</table>  