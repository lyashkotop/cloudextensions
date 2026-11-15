package com.streambundle.v38;
public class BundleMetadata {
 public static String key(String u){return u;}
 public static Object get(Object o,String f){try{return o.getClass().getMethod("get"+f).invoke(o);}catch(Exception e){throw new IllegalStateException(e);}}
 public static void set(Object o,String f,Class t,Object v){try{o.getClass().getMethod("set"+f,t).invoke(o,v);}catch(Exception e){throw new IllegalStateException(e);}}
 public static String string(Object o){return o==null?"":o.toString();}
 public static String text(String s){return org.jsoup.Jsoup.parse(s).text();}
 public static String title(String a,String b,String c){return text(a);}
 public static String absolute(String a,String b){return java.net.URI.create(a).resolve(b).toString();}
 public static org.json.JSONObject ownVideo(Object o,String u,int d,boolean v){throw new UnsupportedOperationException();}
}