<%@ page contentType="text/html; charset=windows-874" %>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!--�ѧ��ѹ�ʴ���ͼԴ��Ҵ 1 ��ͼԴ��Ҵ-->
<script language='javascript'>
function msg(er){
alert(er)
}
</script>
<!--���ʹ�ʴ���ͼԴ��Ҵ���¢�ͼԴ��Ҵ-->
<%!
public static void showEr(Vector errors,JspWriter out)throws Exception{
out.println("<br><table width='50%' border='1' align='center' cellpadding='0' cellspacing='0' bordercolor='black' >"
  +"<tr><td bgcolor='#FF0000'><font color='#FFFFFF' ><b>�Դ��ͼԴ��Ҵ</b></font></td>"
  +"</tr><tr><td bgcolor='#ECE9D8'><br>");
for(int i=0;i<errors.size();i++){
out.println("<li>"+errors.elementAt(i));
}
out.println("<br><br><center> <input type='submit' name='Submit' value='��Ѻ����' onClick='javascript:history.back(1)'>" 
    +"</center></td></tr></table><br>");
}
%>
<!--���ʹ��Ǩ�ͺ����繵����Ţ�������-->
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
<!--���ʹ������¹�ѹ���ҡ�ٻẺ yy--mm--dd ���ٻẺ�����µ�� style ����˹�-->
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