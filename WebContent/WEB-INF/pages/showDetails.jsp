<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<s:debug/>
	productId:${id }
	<br>
	productName:${name }
	<br>
	productPrice:${price }
	<br>
	productPrice:<s:property value="[0].price"/>
	<br>
	productPrice:<s:property value="price"/>
	<br>
	Test.productDesc:${sessionScope.test.desc }
	<s:property value="#session.test.desc"/>
	<br>
	Product.productDesc:${requestScope.product.desc }
	<s:property value="#request.product.desc"/>
	
	<!-- 使用OGNL调用public类的public类型的静态字段和静态方法 -->
	<s:property value="@java.lang.Math@PI"/>
	<br>
	<s:property value="@java.lang.Math@cos(0)"/>
	
	<!-- 使用OGNL调用对象栈的方法 -->
	<s:property value="setName('james')"/>
	<s:property value="name"/>
	
	<!-- 使用OGNL来访问数组的属性和其中的元素 -->
	<%
		String[] names = {"aa","bb","cc","dd"};
		request.setAttribute("names", names);
	%>
	<br><br>
	names.length:<s:property value="#attr.names.length"/>
	<br>
	names[2]:<s:property value="#attr.names[2]"/>
	
	<!-- 使用OGNL来访问Map -->
	<%
		Map<String, String> map = new HashMap<>();
		map.put("AA", "a");
		request.setAttribute("map", map);
	%>
	<br>
	<s:property value="#attr.map.size"/>
	<br>
	AA:<s:property value="#attr.map['AA']"/>
</body>
</html>