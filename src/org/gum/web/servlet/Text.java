package org.gum.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class Text extends HttpServlet {
    private String message;

    @Override
    public void init() throws ServletException {
        message = "Hello World , Nect To Meet You: " + System.currentTimeMillis();
        System.out.println("servlet初始化……");
        super.init();
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter writer = response.getWriter();
        writer.write("<h1>" + message + "</h1>");
        destroy();
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }


    @Override
    public void destroy() {
        System.out.println("servlet销毁！");
        super.destroy();
    }
}
