package br.beans;
import java.util.Vector;
public class  FormBook{
private String b_id,name,bt_id,nd_rent,m_rent,m_pay,priv;
Vector errors;
public FormBook(){
	b_id=name=bt_id=nd_rent=m_rent=m_pay=priv="";
	errors=new Vector();
}
public void setB_id(String b_id){
this.b_id=b_id;
}
public String getB_id(){
return b_id;
}
public void setName(String name){
this.name=name;
}
public String getName(){
return name;
}
public void setBt_id(String bt_id){
this.bt_id=bt_id;
}
public String getBt_id(){
return bt_id;
}
public void setNd_rent(String nd_rent){
this.nd_rent=nd_rent;
}
public String getNd_rent(){
return nd_rent;
}
public void setM_rent(String m_rent){
this.m_rent=m_rent;
}
public String getM_rent(){
return m_rent;
}
public void setM_pay(String m_pay){
this.m_pay=m_pay;
}
public String getM_pay(){
return m_pay;
}
public void setPriv(String priv){
this.priv=priv;
}
public String getPriv(){
return priv;
}
public Vector getErrors(){
return errors;
}
public boolean isErrors(){
boolean er=false;
if((ckNumeric(b_id))||(b_id.length()!=8)){
errors.add("ตรวจสอบ รหัสหนังสือ");
er=true;
}
if(name.equals("")){
errors.add("ตรวจสอบ ชื่อประเภทสมาชิก");
er=true;
}
if(bt_id.equals("0")||ckNumeric(bt_id)){
errors.add("ตรวจสอบ ประเภทหนังสือ");
er=true;
}
if(ckNumeric(m_rent)){
errors.add("ตรวจสอบ ค่าเช่า");
er=true;
}
if(ckNumeric(m_pay)){
errors.add("ตรวจสอบ ค่าปรับ/วัน");
er=true;
}
return er;
}
public boolean ckNumeric(String param){
	boolean e=false;
	try{
		long i=Long.parseLong(param);
	}catch(NumberFormatException e3){
	e=true;
	}return e;
	}
}