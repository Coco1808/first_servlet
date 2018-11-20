<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/29
  Time: 22:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>index</title>
</head>
<body>
<%
    String msg = "";

    Cookie[] cookies = request.getCookies();

    Object res = request.getAttribute("res");

    if (res == null) {
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if ("uname".equals(cookies[i].getName())) {
                    session.setAttribute("name", "1");

                }
                if ("upassword".equals(cookies[i].getName())) {
                    session.setAttribute("password", "1");
                }
            }
        }
        if (session.getAttribute("name") == "1" && session.getAttribute("password") == "1") {
            response.sendRedirect("JDBCselect.jsp");
        }
        msg = "input name and password";
    } else if (res.toString().equals("1")) {
        msg = "user error";
    } else if (res.toString().equals("2")) {
        msg = "password error";
    }
    out.print(msg);
%>
<form action="JDBCselect.jsp" method="post">
    <input type="text" name="name" /><br>
    <input type="password" name="password" /><br>
    <input type="radio" name="radiomd" value="0" checked="checked" />不保存密码
    <input type="radio" name="radiomd" value="7" />一周免登
    <input type="radio" name="radiomd" value="30" />一月免登<br>
    <input type="submit" value="登录"/>
    <input type="button" onclick="window.open('register.jsp')" value="注册"/>
</form>
</body>
</html>
