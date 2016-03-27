package br.beans;
import java.util.*;
public class ShopBook {
protected Hashtable items = new Hashtable();
private String b_id;
public ShopBook(){
b_id=new String();
items=new Hashtable();
}
public Enumeration getItem(){
return items.elements();
}
public void setB_id(String b_id){
this.b_id=b_id;
}
public void addItem(String b_id,String name,String nd_rent,String m_rent){
String [] item={b_id,name,nd_rent,m_rent};
items.put(b_id,item);
}
public void close(){
items=new Hashtable();
}
public void removeItem(String b_id){
	for (int i=0;i<items.size();i++){
		if (items.containsKey(b_id)) {
		items.remove(b_id);
		}
	}
}
public boolean isErrors(){
boolean er=false;
if(!items.isEmpty()){
Enumeration eu=items.elements();
	String [] temp;
	while(eu.hasMoreElements()){
		temp=(String[])eu.nextElement();
		if(b_id.equals(temp[0]))
		{
			er=true;
		}
	}
}return er;
}
}