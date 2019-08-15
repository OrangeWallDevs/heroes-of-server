
package com.orangewall.heroesofserver.servlet;

import com.orangewall.heroesofserver.util.SQL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/simpleServlet")
public class SimpleServletTest extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        try (PrintWriter pw = resp.getWriter()) {
            ResultSet rs = SQL.query("SELECT * FROM scene");

            while (rs.next()) {
                pw.println("Registro da cena: " + rs.getObject("codScene"));
            }            
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        
    }
    
}
