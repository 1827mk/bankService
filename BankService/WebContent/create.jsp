

<%@ page contentType="text/html; charset=windows-874" %>


<%@ page import="java.sql.*"%>









<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
function dil(form)
{
  for(var i=0; i<3; i++)
   {
        if(!isNaN(form.elements[i].value))
		{
		   alert("This Field must be Char's")
		   form.elements[i].value=""	
		   form.elements[i].focus()
		   return false
		}
   } 
    if(document.F1.password.value!=document.F1.repassword.value)
    {
	   alert("Check Confirm PWD"); 
	   document.F1.repassword.value=""
	   document.F1.repassword.focus()	
	   return false
	}
	
	
	if(!isNaN(document.F1.phone.value))
   {
	   if(document.F1.phone.value >9999999999 )
	   {
		 alert("ye kabhi nhi aayegi")
		 document.F1.phone.value=""
		 document.F1.phone.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.phone.value=""
	   return false
   }
	
	
	

   if(!isNaN(document.F1.amount.value))
   {
	   if(document.F1.amount.value < 500)
	   {
		 alert("Minimum Balance should be 500 /-")
		 document.F1.amount.value=""
		 document.F1.amount.focus()
         return false   
	   }
   }
   else
   {
       alert("This  field  must  be  number")
	   document.F1.amount.value=""
	   return false
   }
   
   

   for(var i=0; i<form.elements.length; i++)
   {
		if(form.elements[i].value == "")
		{
		   alert("Fill out all Fields")
		   document.F1.username.focus()
		   return false
		}
   }

   

   return true   
   }
</SCRIPT>


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
	<h1>CREATE<span class="style1"></span></h1>
    <h2>CREATE ACCOUNT Service</h2>
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
    <li><a href="about.jsp">ABOUT US</a></li>
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
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>OPEN ACCOUNT FORM</h1><br>
    	
    	
    	
    	    <table  align="center" bgcolor="white">
	
		    <tr>
			<td width="1000">
			
			
			
               <%--FORM --%>
                     <%@ include file="add_book.jsp" %>



                   <%--FORM --%>


			   </td>
			
	         	</tr>
	         	<tr>
	         	   <img src="images/globe_10.gif" alt="business" width="196" height="106">
	         	</tr>
	         	
		
	
	           </table>
    	   </div>      
    </td>
    
  
             	
    
</tr></table>
    
<div id="footer_top">
  <div id="footer_navigation">
  

  </div>
  
  <div id="footer_copyright" >
 
    	    <center><img src="images/globe_12.gif" alt="business"  width="196" height="106"></center><br>
		    <p> </div>
</div>

<script type="text/javascript">
document.onload = ctck();
</script>
</div>

</body>
</html>

