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
	<s:form action="user-register">
		<s:textfield name="name" label="用户名"></s:textfield>
		<s:password name="password" label="密码"></s:password>
		<s:radio list="#{'1':'男','2':'女'}" name="gender" label="性别"></s:radio>
		<s:select list="#request.depts" name="dept" label="部门" headerKey="" headerValue="请选择" listKey="id" listValue="name"></s:select>
		<s:checkboxlist list="#request.roles" name="roles" label="角色" listKey="id" listValue="name"></s:checkboxlist>
		<s:textarea name="desc" label="描述"></s:textarea>
		<s:submit></s:submit>
	</s:form>
</body>
</html>