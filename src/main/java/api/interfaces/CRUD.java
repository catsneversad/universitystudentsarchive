package api.interfaces;

import api.models.Club;

import javax.ws.rs.core.Response;

public interface CRUD<T> {
    Response create(T object) throws Exception;
    T read(int id) throws Exception;
    Response update(T object) throws Exception;
    Response delete(int id) throws Exception;

}
