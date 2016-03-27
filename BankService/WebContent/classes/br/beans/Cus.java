package br.beans;
public class Cus 
{
private String fname;
private String address;
private String ed_date;
private String pic_name;
private String ct_id;
private String c_id;
private String name;
private String discount;
private String mc;
public Cus(){
fname=address=ed_date=name=pic_name=discount=mc=ct_id=c_id="";
}
public void setFname(String fname){
this.fname=fname;
}
public String getFname(){
return fname;
}
public void setAddress(String address){
this.address=address;
}
public String getAddress(){
return address;
}
public void setEd_date(String ed_date){
this.ed_date=ed_date;
}
public String getEd_date(){
return ed_date;
}
public void setPicName(String pic_name){
this.pic_name=pic_name;
}
public String getPicName(){
return pic_name;
}
public void setName(String name){
this.name=name;
}
public String getName(){
return name;
}
public void setDiscount(String discount){
this.discount=discount;
}
public String getDiscount(){
return discount;
}
public void setMc(String mc){
this.mc=mc;
}
public String getMc(){
return mc;
}
public void setCt_id(String ct_id){
this.ct_id=ct_id;
}
public String getCt_id(){
return ct_id;
}
public void setC_id(String c_id){
this.c_id=c_id;
}
public String getC_id(){
return c_id;
}
public void close(){
fname=address=ed_date=name=pic_name=discount=mc=ct_id=c_id="";
}
public boolean isErrors(){
boolean er=false;
if(c_id.equals("")){
er=true;
}else{
	try{
	long i=Long.parseLong(c_id);
	}catch(NumberFormatException e){ er=true;}
}return er;
}
}