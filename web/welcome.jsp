<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="javaWeb.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="seesion.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>welcome</title>
</head>
<body>
welcome to
<%
    User user = (User) session.getAttribute("user");
    out.print(user.getName() + "!");
%>
<br>
<a href="delete.jsp">删除用户页面</a>
<br>
<a href="update.jsp">修改用户页面</a>
<br>
<%
    String className = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/test";
    String username = "root";
    String password = "123456";

    String sql = "select * from user";

    try {
        Class.forName(className);

        Connection conn = DriverManager.getConnection(url, username, password);

        PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>
<table frame="box" border="1" align="center" cellpadding="0"
       cellspacing="0" bgcolor="#F9F1ED">
    <tr>
        <td align="center" width="160">id</td>
        <td align="center" width="160">用户名</td>
        <td align="center" width="160">用户密码</td>
    </tr>
    <%
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td align=\"center\">" + rs.getInt(1) + "</td>");
                out.println("<td align=\"center\">" + rs.getString(2) + "</td>");
                out.println("<td align=\"center\">" + rs.getString(3) + "</td>");
                out.println("</tr>");
            }

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>