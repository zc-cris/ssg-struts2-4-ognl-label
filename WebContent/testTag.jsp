<%@page import="cn.zc_cris.PersonComparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="cn.zc_cris.Person"%>
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
	s:property标签：打印值栈中的属性值：对于对象栈，是打印对应的属性值
	<br>
	<s:property value="name"/>
	<br>
	对于map栈，打印request，session，application的某个属性值或者某个请求参数的值
	<br>
	<s:property value="#session.date"/>
	<br>
	name:${param.name }		<!-- 暂时无法通过ognl表达式来获取parameters的值 -->
	
	s:url标签,主要是用来构架url地址<br>
	<!-- value值只需要加/，就自动的加上contextPath -->
	<s:url value="/testUrl" var="url1">
		<!-- 指定url包含的请求参数，1003不可能是一个属性名，struts2把1003直接作为属性值 -->
		<s:param name="id" value="1003"></s:param>
	</s:url>
	${url1 }	<!-- /ssg-struts2-ognl/testUrl?id=1003 -->
	<br>
	
	<s:url value="/testUrl" var="url2">
		<!-- ognl会自动的进行value解析，去ValueStack中寻找对应的属性值 -->
		<s:param name="id" value="id"></s:param>
		<s:param name="date" value="#session.date"></s:param>
	</s:url>
	${url2 }	<!-- /ssg-struts2-ognl/testUrl?id=1  -->
	<br>
	
	<s:url value="/testUrl" var="url3">
		<!-- 如果不希望ognl自动进行value解析，可以在value中在添加'' -->
		<s:param name="id" value="'adbc'"></s:param>
	</s:url>
	${url3 }	<!-- /ssg-struts2-ognl/testUrl?id=adbc  -->
	<br>
	
	<!-- 动态构建访问action的url地址，为其添加action及其动态方法调用 -->
	<s:url var="url4" namespace="/helloworld" action="testUrlAction" method="test"></s:url>
	${url4 }	<!-- /ssg-struts2-ognl/helloworld/testUrlAction!test.action -->
	<br>
	
	<!-- 可以获取到转发过来的原url地址中的parameters参数，属性值可以是no，get，all（包含get和post请求） -->
	<s:url value="/testUrl" var="url5" includeParams="get"></s:url>
	${url5 }	<!-- /ssg-struts2-ognl/testUrl?name=james -->
	
	c:set标签：向page，request，session，application域对象中设置一个属性值
	<br>
	<!-- 对value属性值自动进行ognl解析 -->
	<s:set var="playerName" value="name" scope="page"></s:set>
	playerName:${pageScope.playerName }
	<br>
	
	s:push标签：把一个对象在标签开始时压入到值栈顶，标签结束时，弹出值栈<br>
	<%
		Person person = new Person();
		person.setAge(12);
		person.setName("rose");
		request.setAttribute("person", person);
	%>
	<s:push value="#request.person">
		${name }
	</s:push>
	<br>
	
	s:if,else和elseif标签：可以直接识别值栈中的属性值（包括对象栈和Map栈）
	<s:if test="price>100000">
		超级巨星
	</s:if>
	<s:elseif test="price>50000">
		巨星
	</s:elseif>
	<s:else>
		球星
	</s:else>
	<br>
	<s:if test="#request.person.age>10">
		大于10岁
	</s:if>
	<s:else>
		小于或等于10岁
	</s:else>
	
	s:iterator标签：遍历集合的，把这个可遍历对象里的每一个元素一次压入和弹出(从值栈的对象栈或者Map栈得到集合)<br>
	<%
		List<Person> persons = new ArrayList<Person>();
		persons.add(new Person("a",10));
		persons.add(new Person("b",20));
		persons.add(new Person("c",30));
		persons.add(new Person("d",40));
		request.setAttribute("persons", persons);
	%>
	<s:iterator value="#request.persons" status="status">
		index:${status.index }-count:${status.count }-${name }-${age }<br>
	</s:iterator>
	
	<s:iterator value="lists" status="status">
		index:${status.index }-count:${status.count }-${name }-${age }<br>
	</s:iterator>	
	
	s:sort标签：用来对一个可遍历对象里的元素进行排序,先要有排序器类
	<%
		PersonComparator comparator = new PersonComparator();
		request.setAttribute("comparator", comparator);
	%>
	<s:sort comparator="#request.comparator" source="lists" var="newLists"></s:sort>
	<s:iterator value="#attr.newLists">
		${name }-${age }<br>
	</s:iterator>
	
	s:date标签，对于事件date进行排版<br>
	<s:date name="#session.date" format="yyyy-MM-dd hh:mm:ss" var="date2"/>
	date:${date2 }
	
	s:a标签，用来构建超链接的<br>
	<s:iterator value="lists">
		<!-- 可以使用%{}将属性包装起来，使其进行强制ognl 解析 -->
		<s:a href="getPerson?name=%{name}">${name }</s:a>
	</s:iterator>
	
	
	
	
	
</body>
</html>