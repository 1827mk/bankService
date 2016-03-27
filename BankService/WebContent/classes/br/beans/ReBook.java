package br.beans;
import java.util.*;
public class ReBook {
protected Hashtable items = new Hashtable();
public ReBook(){
items=new Hashtable();
}
public Enumeration getItem(){
return items.elements();
}
public void addItem(String b_id,String exp,String name,String m_pay,String pay,String r_id){
String [] item={b_id,exp,name,m_pay,pay,r_id};
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
}