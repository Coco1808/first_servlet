<%--
  Created by IntelliJ IDEA.
  User: Jet Shang
  Date: 2018/10/26
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    int day = 4;
%>
<html>
<head>
    <title>Hello</title>
</head>
<body>
<h3>Swhich 实例</h3>
<%
    switch (day){
        case 1:
            out.print("周一");
            break;
        case 2:
            out.print("周二");
            break;
        case 3:
            out.print("周三");
            break;
        case 4:
            out.println("星期四");
            break;
        case 5:
            out.println("星期五");
            break;
        case 6:
            out.print("周六");

            break;
            default:
                out.print("周日");
    }
%>
</body>
</html>
