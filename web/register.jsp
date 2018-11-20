<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/30
  Time: 0:04
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
<form action="JDBCinsert.jsp" method="post">
    Name : <input name="name" type="text"/><br/>
    Password : <input name="password" type="text"/><br/>
    <input type="submit" value="添加用户"/>
</form>
</body>
</html>