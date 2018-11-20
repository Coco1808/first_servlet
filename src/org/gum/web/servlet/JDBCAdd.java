package org.gum.web.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JDBCAdd extends HttpServlet {

    public void init() throws ServletException {
        System.out.println("init");
    }

    public void init(ServletConfig config) throws ServletException {
        System.out.println("init with config");

        System.out.println(config.getInitParameter("product"));
        System.out.println(config.getInitParameter("nums"));
    }

    protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
        System.out.println("service");
        //doGet,doPost

        super.service(arg0, arg1);
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("doGet");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");

//		String userId = request.getParameter("id");
//		String userName = request.getParameter("name");
//		String userPassword = request.getParameter("password");
//
//		String sql = "insert into tab_user (id, name, password) values ("+userId+", '"+userName+"', '"+userPassword+"')";
//
//		String className = "com.mysql.jdbc.Driver";
//		String url = "jdbc:mysql://127.0.0.1:3306/test";
//		String user = "u1";
//		String password = "abc";
//
//		int count = 0;
//		try {
//			Class.forName(className);
//
//			Connection conn = DriverManager.getConnection(url, user, password);
//
//			Statement stmt = conn.createStatement();
//
//			count = stmt.executeUpdate(sql);
//
//			stmt.close();
//			conn.close();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		if (count >= 0) {
//			response.sendRedirect("181113_3.jsp");
//		} else {
//			response.sendRedirect("181113_4.jsp");
//		}
    }

    public void destroy() {
        System.out.println("destroy");
    }
}
