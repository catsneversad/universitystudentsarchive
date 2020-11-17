package api.services;

import api.interfaces.IAuth;
import api.models.Admin;
import api.models.Group;
import api.models.Major;
import api.models.Student;
import java.sql.*;

public class AuthService extends BasicService implements IAuth {

    @Override
    public Student authenticate(String email, String password) throws Exception {
        String query = "select *, g.name as group_name, m.name as major_name from student s " +
                "inner join _group g on s.group_id = g.id " +
                "inner join major m on s.major_id = m.id " +
                "where s.email = '" + email + "' and s.password = '" + password + "' ";
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        if (!resultSet.isBeforeFirst()){
            throw new Exception("Student not found");
        }
        resultSet.next();
        return new Student(
                resultSet.getInt("id"),
                resultSet.getString("firstName"),
                resultSet.getString("lastName"),
                resultSet.getString("email"),
                new Group(resultSet.getInt("group_id"), resultSet.getString("group_name")),
                new Major(resultSet.getInt("major_id"), resultSet.getString("major_name")),
                resultSet.getInt("year")
        );
    }

    @Override
    public Admin admin_authenticate(String email, String password) throws Exception {
        String query = "select * from admin where email = '" + email + "' and password = '" + password + "'";
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        if (!resultSet.isBeforeFirst()){
            throw new Exception("Admin not found");
        }
        resultSet.next();
        return new Admin(
                resultSet.getInt("id"),
                resultSet.getString("email")
        );
    }

    @Override
    public void logOut() {

    }
}
