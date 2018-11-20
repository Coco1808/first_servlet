<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/30
  Time: 0:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javaWeb.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login</title>
</head>
<body>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");

    if (name.equals("cluom") && password.equals("cluom")) {
        User user = new User(name, password);
        session.setAttribute("user", user);
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }
%>
</body>
</html>