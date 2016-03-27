<%@ page contentType="text/html; charset=windows-874" %>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Global Banking ..</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>

</head>

<body>

<div id="top_links">
  


<div id="header">
	<h1>JSP - BANK<span class="style1"></span></h1>
    <h2>Web Dynamic JSP</h2>	
       <A href="index.jsp"><IMG SRC="images/home1.gif"></IMG></A>	

</div>

<div id="navigation">
    <ul>
    <li><a href="create.jsp">NEW ACCOUNT</a></li>
    <li><a href="balance1.jsp">BALANCE</a></li>
    <li><a href="deposit1.jsp">DEPOSIT</a></li>
    <li><a href="withdraw1.jsp">WITHDRAW</a></li>
    <li><a href="transfer1.jsp">TRANSFER</a></li>
    <li><a href="closeac1.jsp">CLOSE A/C</a></li>
    <li><a href="about.jsp">Contact Us</a></li>
    </ul>
</div>



<table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li><a href="https://spring.io/">https://spring.io/</a></li>
            <li><a href="#">https://spring.io/ </a></li>
            <li><a href="#">https://spring.io/</a></li>
            </ul>
			
       </div>
	</td>
    
    <td width="1200" valign="top">
    	
    	<% 
%>
<table>     

 <%@ include file="add_book.jsp" %>
 <tr><td>
   <a href="add_book.jsp"> OPEN ACCOUNT </a>  
   </td>
  </tr>
   
			</table><%
%>
    	
    	
		</table>



<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="g.*" %>

