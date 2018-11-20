<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/19
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String title = "I am a title!";
    String body = "welcome to my jsp!";
%>
<html>
  <head>
    <title><%=title%></title>
    <script>
      function onH1click() {
          alert("I am run client!");
//前端运行
      }
    </script>
  </head>
  <body>
    <h1 onclick="onH1click()"><%=body%></h1>

  </body>
</html>
