<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 23:45
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page import=".*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="seesion.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<form action="JDBCupdate.jsp" method="post">
    Name : <input name="name" type="text"/><br/>
    newId:<input name="newid" type="text"/><br/>
    newName:<input name="newname" type="text"/><br/>
    newPassword:<input name="newpassword" type="text"/><br/>
    <input type="submit" value="修改用户"/>
</form>
<%
    String className = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/test";
    String username = "root";
    String password = "123456";

    String sql = "select * from user";

    try {
        Class.forName(className);

        Connection conn = DriverManager.getConnection(url, username, password);

        PreparedStatement pstmt = (PreparedStatement)conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
%>
<table frame="box" border="1" align="center" cellpadding="0" cellspacing="0" bgcolor="#F9F1ED">
    <tr>
        <td align="center" width="160">id</td>
        <td align="center" width="160">用户名</td>
        <td align="center" width="160">用户密码</td>
    </tr>
    <%
            while(rs.next()){
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