<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>