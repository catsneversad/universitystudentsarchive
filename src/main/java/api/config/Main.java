package api.config;

import api.models.Event;
import api.services.FetchService;

import java.util.ArrayList;

public class Main {
    public static void main(String args[]) throws Exception {
        FetchService fetchService = new FetchService();
        ArrayList<Event> events = fetchService.fetchEvents(0,0);
        System.out.println(events);
    }
}
