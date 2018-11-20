<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 23:53
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
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    User u = new User();

    if (session.getAttribute("name") == "1" && session.getAttribute("password") == "1") {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if ("uname".equals(cookies[i].getName())) {
                    u.setName(cookies[i].getValue());
                }
                if ("upassword".equals(cookies[i].getName())) {
                    u.setPassword(cookies[i].getValue());
                }
            }
        }
    }else{
        u.setName(request.getParameter("name"));
        u.setPassword(request.getParameter("password"));
    }
%>
<%
    String className = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://127.0.0.1:3306/test";
    String user = "root";
    String password = "123456";

    String sql = "select * from user where name='" + u.getName() + "' and password='" + u.getPassword() + "'";

    try {
        Class.forName(className);

        Connection conn = DriverManager.getConnection(url, user, password);

        PreparedStatement pstmt = (PreparedStatement) conn.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();

        if (!rs.next()) {
            rs.close();
            pstmt.close();
            conn.close();
            request.setAttribute("res", "1");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        if (!u.getPassword().equals(rs.getString(3))) {
            rs.close();
            pstmt.close();
            conn.close();
            request.setAttribute("res", "2");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        String value = request.getParameter("radiomd");
        if(value != null){
            if(value.equals("7")){
                Cookie uname = new Cookie("uname", u.getName());
                Cookie upassword = new Cookie("upassword", u.getPassword());
                uname.setMaxAge(604800);
                upassword.setMaxAge(604800);
                response.addCookie(uname);
                response.addCookie(upassword);
            } else if(value.equals("30")){
                Cookie uname = new Cookie("uname", u.getName());
                Cookie upassword = new Cookie("upassword", u.getPassword());
                uname.setMaxAge(2592000);
                upassword.setMaxAge(2592000);
                response.addCookie(uname);
                response.addCookie(upassword);
            }
        }
        session.setAttribute("user", u);
        response.sendRedirect("welcome.jsp");

        rs.close();
        pstmt.close();
        conn.close();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
</body>
</html>