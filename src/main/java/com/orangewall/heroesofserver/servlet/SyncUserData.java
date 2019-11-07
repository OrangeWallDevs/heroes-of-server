
package com.orangewall.heroesofserver.servlet;

import com.google.gson.reflect.TypeToken;
import com.orangewall.heroesofserver.model.GameUser;
import com.orangewall.heroesofserver.model.Score;
import com.orangewall.heroesofserver.util.JSON;
import com.orangewall.heroesofserver.util.SQL;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/syncUserData")
public class SyncUserData extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        resp.setCharacterEncoding("UTF-8");
        req.setCharacterEncoding("UTF-8");
        
        String jsonUser = req.getParameter("user"),
               jsonScores = req.getParameter("scores");
        
        if (jsonUser != null && !jsonUser.isEmpty()
                && jsonScores != null && !jsonScores.isEmpty()) {
            GameUser user = JSON.parse(jsonUser, GameUser.class);
            List<Score> scores = JSON.parse(jsonScores,
                    new TypeToken<List<Score>>() {}.getType());
            boolean isUserRegistered = SQL.getRegistros(GameUser.class,
                    "WHERE idtGoogleAccount = '" + user.getIdtGoogleAccount() + "'")
                        .size() == 1;

            if (isUserRegistered) {
                System.out.println("updating new user");
                SQL.update(user);
                scores.forEach(SQL::update);
            } else { // new synchronized user
                System.out.println("inserting new user");
                SQL.insert(user);
                scores.forEach(SQL::insert);
            }
        }
        
        resp.setStatus(200);
        
    }
    
}
