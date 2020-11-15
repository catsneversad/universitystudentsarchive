package api.interfaces;


import api.models.Admin;
import api.models.Student;

public interface IAuth {
    Student authenticate(String email, String password) throws Exception;
    Admin admin_authenticate(String email, String password) throws Exception;
    void logOut();
}
