package br.beans;
import java.util.Vector;
public class  FormBookType{
private String name;
private Vector errors;
private boolean er;
public FormBookType(){
name=new String();
errors=new Vector();
er=false;
}
public void setName(String name){
this.name=name;
}
public String getName(){
return name;
}
public Vector getErrors(){
return errors;
}
public boolean isErrors(){
if(name.equals(""))
{
errors.add("ตรวจสอบ ชื่อประเภทหนังสือ");
er=true;
}return er;	
}
} 