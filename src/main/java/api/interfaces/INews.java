package api.interfaces;

import api.models.News;

import javax.ws.rs.core.Response;

public interface INews extends CRUD<News> {
    //CRUD
    Response create(News news) throws Exception;
    News read(int id) throws Exception;
    Response update(News news) throws Exception;
    Response delete(int id) throws Exception;

    //All news
    Response getNews(int major_id) throws Exception;
}
