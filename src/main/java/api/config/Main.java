package api.config;

import api.models.Event;
import api.models.Student;
import api.services.ClubService;
import api.services.FetchService;

import java.util.ArrayList;

public class Main {
    public static void main(String args[]) throws Exception {
        ClubService clubService = new ClubService();
        ArrayList<Student> students = clubService.getStudentsOfClub(2);
        System.out.println(students);
    }
}
