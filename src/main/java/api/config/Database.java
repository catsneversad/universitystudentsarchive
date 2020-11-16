package api.config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Properties;

public class Database {
    public static final String url = "jdbc:postgresql://localhost:5432/AdjavaFinal";
    public static final String user = "postgres";
    public static final String password = "lbvfi2281";
    public static final String driver = "com.mysql.jdbc.Driver";

    public static Connection getConnection(){
        Context initialContext;
        Connection connection = null;
        try
        {
            Class.forName("org.postgresql.Driver");
            String conStr = "jdbc:postgresql://localhost:5432/AdjavaFinal";
            Properties props = new Properties();
            props.setProperty("user","postgres");
            props.setProperty("password","lbvfi2281");
            Connection con = DriverManager.getConnection(conStr, props);
            connection = con;
        }
        catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        return connection;
    }
}
