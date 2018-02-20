<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<s:property value="exception"/>
	<br>
	<s:property value="exception.message"/>
	<br>
	<a href="product-add.action">productAdd</a>
	<br>
	<a href="testTag-property.action?name=james">test Property tag</a>
	<%
		session.setAttribute("date", new Date());
	%>

</body>
</html>