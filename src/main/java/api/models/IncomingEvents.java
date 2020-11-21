package api.models;

public class IncomingEvents {
    private int id;
    private int status;
    private int student_id;
    private int event_id;
    private int incoming_id;

    @Override
    public String toString() {
        return "IncomingEvents{" +
                "id=" + id +
                ", status=" + status +
                ", student_id=" + student_id +
                ", event_id=" + event_id +
                ", incoming_id=" + incoming_id +
                '}';
    }

    public IncomingEvents(int status, int student_id, int event_id, int incoming_id) {
        this.status = status;
        this.student_id = student_id;
        this.event_id = event_id;
        this.incoming_id = incoming_id;
    }

    public IncomingEvents(int id, int status, int student_id, int event_id, int incoming_id) {
        this.id = id;
        this.status = status;
        this.student_id = student_id;
        this.event_id = event_id;
        this.incoming_id = incoming_id;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getStudent_id() {
        return student_id;
    }

    public void setStudent_id(int student_id) {
        this.student_id = student_id;
    }

    public int getEvent_id() {
        return event_id;
    }

    public void setEvent_id(int event_id) {
        this.event_id = event_id;
    }

    public int getIncoming_id() {
        return incoming_id;
    }

    public void setIncoming_id(int incoming_id) {
        this.incoming_id = incoming_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
