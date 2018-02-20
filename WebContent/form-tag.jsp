<%@page import="cn.zc_cris.City"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
	<%
		List<City> cities = new ArrayList<>();
		cities.add(new City(1002,"北京"));
		cities.add(new City(1003,"上海"));
		cities.add(new City(1004,"成都"));
		cities.add(new City(1005,"重庆"));
		request.setAttribute("cities", cities);
	%>
	<!-- 
		struts2中的表单标签：
		1. 使用和html中的form标签没有太大区别
		2. struts2中的form标签会自动生成一个table，以便进行排版
		3. 可以对表单中的值进行自动的回显，原理：从栈顶对象开始匹配属性，并把匹配到的属性赋值给对应的标签的value值，若栈顶对象没有对应的属性值，则依次向下寻找对应的属性
			好处：可以手动的往值栈栈顶放入需要回显的数据对象
		4. 密码标签想要回显数据需要特殊设置一下
		5. checkbox标签，不同于html的多选，这是一个用于单选的复选标签，用于提交一个布尔值；当包含着一个复选框的表单被提交时，如果某个复选框被选中了，它的值将为true，这个复选框就会在http请求里增加一个
			请求参数，但如果该复选框没有被选中，在请求中就不会增加一个请求参数，checkbox标签为了解决这个局限性，采取的是为这个复选框元素创建一个匹配的不可见字段，只有两个字段的值同时被提交后台
			才会显示true，否则显示false
		<input type="checkbox" name="married" value="true" id="user-save_married"/>
		<input type="hidden" id="__checkbox_user-save_married" name="__checkbox_married" value="true" />
		6. radio标签：单选框，可以直接构建map作为选项
		7. checkboxlist标签：多选框，可以直接从值栈获取对象集合，key和value可以指定对象的属性
		8. select标签：下拉框
	 -->
	
	<s:form action="user-save">
		<s:hidden name="id"></s:hidden>
		<s:textfield name="name" label="userName"></s:textfield>
		<s:password name="password" label="password" showPassword="true"></s:password>
		<s:textarea name="desc" label="description"></s:textarea>
		<s:checkbox name="married" label="married"></s:checkbox>
		
		<s:radio list="#{'1':'male','2':'female' }" name="gender" label="性别"></s:radio>
		
		<!-- 服务端需要使用集合类型接收，以保证可以进行正常的回显 -->
		<s:checkboxlist list="#request.cities" label="城市" listKey="id" listValue="name" name="city"></s:checkboxlist>
		 
		<s:select list="{1,2,3,4,5,6,7,8,9}" name="age" label="age" headerKey="" headerValue="请选择">
			<!-- s:optgroup 可以用作s:select的子标签，用于显示更多的下拉框选项，但是必须有键值对，而不能像s:select标签一样使用集合，让其值既作为key，又作为value -->
			<s:optgroup label="10-13" list="#{10:10,11:11,12:12,13:13 }"></s:optgroup>
			<s:optgroup label="14-15" list="#{14:14,15:15 }"></s:optgroup>
		</s:select>
		<s:submit></s:submit>
	</s:form>
</body>
</html>