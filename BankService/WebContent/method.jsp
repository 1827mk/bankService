<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!--ฟังก์ชันแสดงข้อผิดพลาด 1 ข้อผิดพลาด-->
<script language='javascript'>
function msg(er){
alert(er)
}
</script>
<!--เมธอดแสดงข้อผิดพลาดหลายข้อผิดพลาด-->
<%!
public static void showEr(Vector errors,JspWriter out)throws Exception{
out.println("<br><table width='50%' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='black' >"
  +"<tr><td bgcolor='#FF0000'><font color='#FFFFFF' ><b>เกิดข้อผิดพลาด</b></font></td>"
  +"</tr><tr><td bgcolor='#ECE9D8'><br>");
for(int i=0;i<errors.size();i++){
out.println("<li>"+errors.elementAt(i));
}
out.println("<br><br><center> <input type='submit' name='Submit' value='กลับไปแก้ไข' onClick='javascript:history.back(1)'>" 
    +"</center></td></tr></table><br>");
}
%>
<!--เมธอดตรวจสอบว่าเป็นตัีวเลขหรือไม่-->
<%!
public boolean ckNumeric(String param){
	boolean e=false;
	try{
		long i=Long.parseLong(param);
	}catch(NumberFormatException e3){
	e=true;
	}return e;
	}
%>
<!--เมธอดใช้เปลี่ยนวันที่จากรูปแบบ yy--mm--dd เป็นรูปแบบภาษาไทยตาม style ที่กำหนด-->
<%!
public String showDateTH(String date,int style){
		Calendar c=new GregorianCalendar();
		String [] sDate=date.split("-");
		c.set(Integer.parseInt(sDate[0]),Integer.parseInt(sDate[1])-1,Integer.parseInt(sDate[2]));
		java.util.Date d=c.getTime();
	     int[] styles = {
         DateFormat.DEFAULT,
         DateFormat.SHORT, 
         DateFormat.MEDIUM,
         DateFormat.LONG,
         DateFormat.FULL
      };
		DateFormat df =DateFormat.getDateInstance(styles[style],new Locale("th","TH"));
       String result =df.format(d);
	   return result;
}
%>