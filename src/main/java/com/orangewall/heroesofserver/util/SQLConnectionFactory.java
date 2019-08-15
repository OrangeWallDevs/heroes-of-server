
package com.orangewall.heroesofserver.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

/**
 *
 * @author Daniel
 */
public class SQLConnectionFactory {
    
    public Connection getConnection() {
        
        try {
            Properties dbProps = IO.getProperties("/configuracoes.properties");
            String url = dbProps.getProperty("db.url"),
                   usuario = dbProps.getProperty("db.usuario"),
                   senha = dbProps.getProperty("db.senha");
            
            System.out.println("Valor url: " + url);
            if (url == null || url.isEmpty()) {
                String connectionUrl = System.getenv("JDBC_DATABASE_URL");
                return DriverManager.getConnection(connectionUrl);
            }
            
            Class.forName("org.postgresql.Driver");                    
            return DriverManager.getConnection(
                    url + "?"
                    + "autoReconnect=false"
                    + "&useSSL=false"
                    + "&useTimezone=true"
                    + "&serverTimezone=UTC",
                usuario, senha);
        } catch (SQLException sqlex) {
            System.out.println("Erro na conexão com o banco de dados.");
            throw new RuntimeException(sqlex);
        } catch (ClassNotFoundException cnfex) {
            System.out.println("O driver não foi encontrado ou carregado corretamente.");
            throw new RuntimeException(cnfex);
        }
        
    }
    
}
