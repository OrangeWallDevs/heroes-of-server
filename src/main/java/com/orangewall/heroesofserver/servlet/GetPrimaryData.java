
package com.orangewall.heroesofserver.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.orangewall.heroesofserver.exception.NotTableException;
import com.orangewall.heroesofserver.model.*;
import com.orangewall.heroesofserver.util.JSON;
import com.orangewall.heroesofserver.util.SQL;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getPrimaryData")
public class GetPrimaryData extends HttpServlet {
    
    List<Class<?>> entityClasses;
    
    @Override
    public void init() throws ServletException {
        entityClasses = new ArrayList<>(
            Arrays.asList(
                AssetFilter.class, Score.class, Part.class, Phase.class,
                GameUser.class, Troop.class, Barrack.class, Tower.class,
                Skill.class, Hero.class, Speak.class, Scene.class, Cutscene.class));
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        JsonParser parser = new JsonParser();
        JsonObject jsonResponse = new JsonObject();
        String userId = req.getParameter("userId");
        
        for (Class<?> entityClass : entityClasses) {
            try {
                List<?> records,
                        primaryKeys = SQL.getPrimaryKeysNames(entityClass);
                
                if (entityClass.equals(Score.class)) {                    
                    if (userId == null || userId.isEmpty()) {
                        continue;                        
                    }                    
                    records = ((List<Score>) SQL.getRegistros(entityClass)).stream()
                            .filter(score -> score.getIdtGoogleAccount().equals(userId))
                            .collect(Collectors.toList());
                } else if (entityClass.equals(GameUser.class)) {                    
                    if (userId == null || userId.isEmpty()) {
                        continue;                        
                    }                    
                    records = ((List<GameUser>) SQL.getRegistros(entityClass)).stream()
                            .filter(user -> user.getIdtGoogleAccount().equals(userId))
                            .collect(Collectors.toList());
                } else {
                    records = SQL.getRegistros(entityClass);
                }
                
                JsonObject table = new JsonObject();
                JsonArray jsonRecords = parser.parse(
                        JSON.stringify(records)).getAsJsonArray(),
                          jsonPrimaryKeys = parser.parse(
                        JSON.stringify(primaryKeys)).getAsJsonArray();

                table.add("primaryKeys", jsonPrimaryKeys);
                table.add("records", jsonRecords);
                
                jsonResponse.add(SQL.getNomeTabela(entityClass), table);
            } catch (NotTableException ex) {
                System.out.println("Erro ao operar com a classe " + entityClass);
                System.out.println(ex);
            }
        }
        
        resp.getWriter().print(jsonResponse);
        resp.setStatus(200);
        
    }
    
}
