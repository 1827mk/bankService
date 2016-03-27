package br.beans;
import java.util.Vector;
public class  FormTypeCus{
private String name;
private String discount;
private String mc;
private String mr;
private Vector errors;
public FormTypeCus(){
	name=discount=mc=mr="";
	errors=new Vector();
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
public void setMr(String mr){
this.mr=mr;
}
public String getMr(){
return mr;
}
public Vector getErrors(){
	return errors;
}
public boolean isErrors(){
boolean er=false;
if(name.equals(""))
{
errors.add("��Ǩ�ͺ ���ͻ�������Ҫԡ");
er=true;
}
if(discount.equals("")){
errors.add("��Ǩ�ͺ ��ǹŴ");
er=true;
}else{
try{
int i=Integer.parseInt(discount);
}catch(NumberFormatException e){
errors.add("��Ǩ�ͺ ��ǹŴ");
er=true;
}
}
if(mc.equals("")){
errors.add("��Ǩ�ͺ ��ҵ����Ҫԡ");
er=true;
}else{
try{
int i=Integer.parseInt(mc);
}catch(NumberFormatException e){
errors.add("��Ǩ�ͺ ��ҵ����Ҫԡ");
er=true;
}
}
if(mr.equals("")){
errors.add("��Ǩ�ͺ �����Ѥ���Ҫԡ");
er=true;
}else{
try{
int i=Integer.parseInt(mr);
}catch(NumberFormatException e){
errors.add("��Ǩ�ͺ �����Ѥ���Ҫԡ");
er=true;
}
}return er;	
}
}