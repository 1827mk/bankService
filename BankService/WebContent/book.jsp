<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.sql.*"%>
<%@ include file="config.jsp"%> 
<%
//ติดต่อกับฐานข้อมูล แล้วเลือกค่าทั้งหมดจากตาราง book
Class.forName(driver);
Connection con=DriverManager.getConnection(url,user,pw);
Statement stmt=con.createStatement();
String sql="select * from bookbank order by b_id";
ResultSet rs=stmt.executeQuery(sql);
%> 
<center><b><a href="bank.jsp">ลงทะเบียนบัญชีใหม่</a></b></center><br>

<center><b><a href="bank.jsp">กลับหน้าแรก</a></b></center><br>




<!--แสดงรายละเอียดหนังสือต่างๆ, การเชื่อมโยงแก้ไข และลบ -->
  <table width="60%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="black">
  <tr bgcolor="#CCCCCC">
    <td width="21%"><b>รหัสบัญชี</b></td>
    <td width="67%"><b>ชื่อ</b></td>
    <td width="5%"><b>ลบ</b></td>
    <td width="7%"><b>แก้ไข</b></td>
  </tr>
  <%while(rs.next()){%>
  <tr bgcolor="#ECE9D8">
    <td><%=rs.getString("b_id")%></td>
    <td><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></td>
    <td><a href='del_book.jsp?b_id=<%=rs.getString("b_id")%>'>ลบ</a></td>
    <td><a href='edit_book.jsp?b_id=<%=rs.getString("b_id")%>'>แก้ไข</a></td>
  </tr>
  <%} %>
</table>  