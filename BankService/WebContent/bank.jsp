
<%@ page language="java" contentType="text/html; charset=windows-874" %>

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



<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <title>	Samarn theme</title>
    
    <script src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>
    
    <link rel="stylesheet" href="reset.css" type="text/css">
    <link rel="stylesheet" href="styl.css" type="text/css">
        
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext' rel='stylesheet' type='text/css'>

</head>

<body>
    
    <!-- *********  Header  ********** -->
    
    <div id="header">
        <div id="header_in">
        
        <h1><a href="index.html"><b>SAMARN</b> THEME</a></h1>
        
        <div id="menu">
         <ul>
            <li><a href="index2.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="ourwork.html">Our work</a></li>
            <li><a href="blog.html">Other</a></li>
            <li><a href="bank.jsp" class="active">Open Account</a></li>            
         </ul>
        </div>
        
        </div>
    </div>
    
    <!-- *********  Main part – headline ********** -->
    
        
        <div id="main_part_inner">
            <div id="main_part_inner_in">
        
            <h2>Open Account</h2>
            
            <div class="button_main">
                
                 <a href="http://localhost:8080/BankService/img/hibernate-3.0.1.jar" class="button_dark">DOWNLOAD</a>
            </div>
            
            </div>
            
        </div>
        
        
        <!-- *********  Content  ********** -->
        
        <div id="content_inner">
            
            <!-- *** contact form *** -->
            
           <h3>Leave a message</h3>
           
           <form action="add_book.jsp" method="post" class="formit">
           
            <input name="b_id" type="text" value="<%=getNewB_id(maxB_id)%>"/>
            
         
                
                <select name="bt_id">
            <option value="0" selected>CHOOSE</option>
            <% //แสดงประเภทบัญชีที่อยู่ใน rs
				while(rs.next()){%>
			<option value="<%=rs.getString("bt_id")%>"><%=new String(rs.getString("name").getBytes("ISO8859_1"),"windows-874")%></option>
				 <% } %> 
				 <%  rs.close();  }%>
            </select>
                <input  type="text" name="name"  placeholder="accountname" />
                <input type="text"  name="nd_rent"  placeholder="numberofcreditcard"/>     
                <input name="m_rent" type="text" placeholder="balance"/>
                <input name="m_pay" type="text" placeholder="other"/>
                <input name="priv" type="radio" value="2" checked>NORMAL
              <input name="priv" type="radio" value="1">VIP
              
                 <input name="n_rent" type="hidden" value="0">
              <input type="submit" name="Submit" class="button_submit" value="ADDACC">
         
              
              
         
            </form>

            <div class="cara">

                   
                   
                   </div>
                   
                   
                        <div class="test">
            
             <%--FORM --%>
             
         <%--         <%@ include file="add_book.jsp" %>            --%>   



                   <%--FORM --%>
                   
                   
                   </div>
                   
                   
            
            <h3>Contact information</h3>
            
            <div class="contactinfo">
                <span class="ico_mapmark"><b> Samarn , Bangkok</b></span>    
            </div>
            
            <div class="contactinfo">
                <span class="ico_message"><b>  Spring Professional </b></span>    
            </div>
            
            <div class="contactinfo">
                <span class="ico_iphone"><b>    Thailand </b></span>    
            </div>
            
            <hr class="cleanit">
            
            
            <div class="mapit">
                <iframe width="938" height="360" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=San+Francisco,+CA,+United+States&amp;aq=0&amp;oq=san+f&amp;sll=37.0625,-95.677068&amp;sspn=45.553578,93.076172&amp;ie=UTF8&amp;hq=&amp;ll=37.77493,-122.419416&amp;z=14&amp;output=embed"> 
                </iframe>
            </div>

            
            
            
            
            
        </div>
        
    
    
    <!-- *********  Footer  ********** -->
    
    <hr class="cleanit">
    
     <div id="footer">
        <div id="footer_in">
            
          
            <span>Author: <a href="https://spring.io">Samarn</a></span>

        
        </div>
    </div>
         
<script>
// script for testimonial' tabs
$(function() {
    $("ul.controls").tabs("div.testimonials > div");
});
</script>

</body>
</html>
    