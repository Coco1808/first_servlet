<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javaWeb.*"%>
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
    User u = new User(request.getParameter("name"), request.getParameter("password"));
%>
<%
    String className = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/test";
    String user = "root";
    String password = "123456";

    String sql = "insert into user(name, password) values ('" + u.getName() + "', '" + u.getPassword() + "')";

    try {
        Class.forName(className);

        Connection conn = DriverManager.getConnection(url, user, password);

        Statement stmt = conn.createStatement();

        if (stmt.execute(sql) == false) {
            if (stmt.getUpdateCount() > 0) {
                out.println("<h1>add success</h1>");
            }
        } else {
            out.println("<h1>add failure</h1>");
        }
        out.println("<a href=\"register.jsp\">Back</a>");

        stmt.close();
        conn.close();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html