package api.services;

import api.Response.CustomResponses;
import api.Response.ResponseMessage;
import api.models.*;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NiceService extends BasicService {
    public void createIncoming (Event event) throws SQLException {
        String query = "insert into incoming(name, description, image, club_id, major_id) values (?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, event.getName());
        preparedStatement.setString(2, event.getDescription());
        preparedStatement.setString(3, event.getImage());
        if (event.getClub() != null)
            preparedStatement.setInt(4, event.getClub().getId());
        else
            preparedStatement.setObject(4, null);
        if (event.getMajor() != null)
            preparedStatement.setInt(5, event.getMajor().getId());
        else
            preparedStatement.setObject(5, null);
        preparedStatement.executeUpdate();
    }

    public Event getIncomingEventByName (String name) throws SQLException {
        String query = "select *, m.name as major_name, c.name as club_name from incoming e " +
                "inner join major m " +
                "on e.major_id = m.id " +
                "inner join club c " +
                "on e.club_id = c.id " +
                "where e.name = " + (char)39 + name + (char)39;

        System.out.println(query);
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        resultSet.next();
        return new Event(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("description"),
                resultSet.getString("image"),
                resultSet.getDate("created_at"),
                new Major(resultSet.getInt("major_id"), resultSet.getString("major_name")),
                new Club(resultSet.getInt("club_id"), resultSet.getString("club_name"))
        );
    }

    public void createReviewInEvent (int studentId, int incoming_id) throws SQLException {
        String query = "insert into eventsinbox (status, student_id, event_id, incoming_id) values (?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, 0);
        preparedStatement.setInt(2, studentId);
        preparedStatement.setObject(3, null);
        preparedStatement.setInt(4, incoming_id);
        preparedStatement.executeUpdate();
    }

    public ArrayList<IncomingEvents> getIncomingEvents () throws SQLException {
        ArrayList<IncomingEvents> list = new ArrayList<>();
        String query = "select * from eventsinbox";
        statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(query);
        resultSet.next();

        while (resultSet.next())

            list.add(new IncomingEvents(
                    resultSet.getInt("id"),
                    resultSet.getInt("status"),
                    resultSet.getInt("student_id"),
                    resultSet.getInt("event_id"),
                    resultSet.getInt("incoming_id")
            ));
        return list;
    }
}
