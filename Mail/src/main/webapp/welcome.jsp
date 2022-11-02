<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.*" %>
      <%@ page import="javax.servlet.http.*" %>
      <%@ page import="com.google.gson.JsonArray"%>
   <%@ page import="com.google.gson.JsonObject"%>
   <%@ page import="com.google.gson.Gson"%>
   <%@ page import="Pojo.Info"%>
   <%@ page import="Pojo.Acc"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mail Data</title>
<script>
function getURLParameter(name) {
	return decodeURI((RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]);
}
function hideURLParams() {
	var hide = ['success','error'];
	for(var h in hide) {
		if(getURLParameter(h)) {
			history.replaceState(null, document.getElementsByTagName("title")[0].innerHTML, window.location.pathname);
		}
	}
}
window.onload = hideURLParams;</script>
<style>
*{
margin:10px;}
</style>
</head>
<body>
<% String s=request.getAttribute("data").toString();
JsonArray arr = Acc.getAsJsonArray("data",s);
for (int i = 0; i < arr.size(); i++) {  
	   JsonObject jsonObj1 = arr.get(i).getAsJsonObject();
	      Info info = (Info)new Gson().fromJson(jsonObj1, Info.class);
	       
	      out.println("<br>Sender:"+ info.getSender());
	      out.println("<br>From:"+info.getFromAddress());
	      out.println("<br>To:"+info.getToAddress());
	      out.println("<br>Subject:"+info.getSubject());
	      out.println("<br>Content:"+info.getSummary());
	      out.println(" <br><hr><br> ");
}

%>

</body>
</html>