<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Facebook Home Feed</title>
</head>
<body>
<a href="home">Home</a><br>
	<h3>Some of my Facebook Posts</h3>
	<ul>${friends.size()}
		<c:forEach items="${friends}" var="friend">
			<li>${friend.name}
			</li>
		</c:forEach>
	</ul>	
</body>
</html>