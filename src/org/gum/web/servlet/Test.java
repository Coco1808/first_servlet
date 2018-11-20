package org.gum.web.servlet;

import java.sql.Connection;

/**
 * Created by Martin17 on 2017/3/16.
 */
public class Test {
    public static void main(String[] args){
        OpenConnection open = new OpenConnection();
        Connection conn = open.getConnection();
        System.out.println(conn);
    }
}
