
package com.orangewall.heroesofserver.servlet;

import com.orangewall.heroesofserver.model.Scene;
import com.orangewall.heroesofserver.util.JSON;
import com.orangewall.heroesofserver.util.SQL;
import java.io.IOException;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addNewScene")
public class AddNewScene extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
//        Scanner input = new Scanner(req.getInputStream());
//        String jsonReceived = "";
//        
//        while (input.hasNext()) {
//            jsonReceived += input.next();            
//        }

        String jsonReceived = req.getParameter("newScene");
        SQL.insert(JSON.parse(jsonReceived, Scene.class));
        resp.setStatus(200);
        
    }
    
}
