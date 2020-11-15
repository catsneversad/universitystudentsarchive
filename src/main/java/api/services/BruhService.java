package api.services;

import api.models.Club;
import api.models.Event;
import com.google.gson.Gson;
import org.glassfish.jersey.client.ClientConfig;

import javax.json.Json;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import java.lang.reflect.Type;
import java.util.ArrayList;

public class BruhService {
    private static String baseUri = "http://localhost:8080/finalproj_war_exploded/api";
    static WebTarget getWebTarget () {
        ClientConfig config = new ClientConfig();
        Client client = ClientBuilder.newClient(config);
        return client.target(baseUri);
    }

    public Event getEvent (String id) {
        WebTarget target = getWebTarget();
        Event event = target.path("events").path(id).request().accept(MediaType.APPLICATION_JSON).get(Event.class);
        return event;
    }
}
