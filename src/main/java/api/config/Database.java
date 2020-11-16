package api.config;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.Properties;

public class Database {
    public static final String url = "jdbc:postgresql://localhost:5432/course_apjava";
    public static final String user = "root";
    public static final String password = "root";
    public static final String driver = "com.mysql.jdbc.Driver";

    public static Connection getConnection(){
        Context initialContext = null;
        Connection connection = null;
        try
        {
            initialContext = new InitialContext();
            Context envCtx = (Context)initialContext.lookup("java:comp/env");
            DataSource ds = (DataSource) envCtx.lookup("jdbc/FinalProject");
            connection = ds.getConnection();
            System.out.println("Connected successfully!");
        }
        catch (NamingException | SQLException e)
        {
            e.printStackTrace();
        }
        return connection;
    }


   /* public static Connection getConnection(){
        Context initialContext;
        Connection connection = null;
        try
        {
            Class.forName("org.mysql.Driver");
            String conStr = "jdbc:mysql://localhost:3309/FinalProject";
            Properties props = new Properties();
            props.setProperty("user","root");
            props.setProperty("password","root");
            Connection con = DriverManager.getConnection(conStr, props);
            connection = con;
        }
        catch (SQLException | ClassNotFoundException e)
        {
            e.printStackTrace();
        }
        return connection;
    }*/
}
