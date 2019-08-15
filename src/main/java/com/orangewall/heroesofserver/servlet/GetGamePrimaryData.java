
package com.orangewall.heroesofserver.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.orangewall.heroesofserver.exception.NotTableException;
import com.orangewall.heroesofserver.model.Scene;
import com.orangewall.heroesofserver.util.JSON;
import com.orangewall.heroesofserver.util.SQL;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getGamePrimaryData")
public class GetGamePrimaryData extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        Class<?>[] entityClasses = {
            Scene.class
        };
        JsonParser parser = new JsonParser();
        JsonObject jsonResponse = new JsonObject();
        
        for (Class<?> entityClass : entityClasses) {
            try {
                JsonObject table = new JsonObject();
                JsonArray records = parser.parse(JSON.stringify(SQL
                        .getRegistros(entityClass))).getAsJsonArray(),
                          primaryKeys = parser.parse(JSON.stringify(SQL
                        .getPrimaryKeysNames(entityClass))).getAsJsonArray();

                table.add("primaryKeys", primaryKeys);
                table.add("records", records);

                jsonResponse.add(SQL.getNomeTabela(entityClass), table);
                resp.setStatus(200);
            } catch (NotTableException ex) {
                System.out.println("Erro ao operar com a classe " + entityClass);
                System.out.println(ex);
            }
        }
        
        System.out.println(jsonResponse);
        resp.getWriter().print(jsonResponse);
        
    }
    
}
