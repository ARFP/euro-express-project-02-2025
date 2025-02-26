import java.time.LocalTime;

public class Trains {
    private int id;
    private String destination;
    private double price;
    private LocalTime depart;
    
    public Trains (int id, String destination, double price, LocalTime depart) {
        this.id = id;
        this.destination = destination;
        this.price = price;
        this.depart = depart;
    }

    public int getId() {
        return id;
    }

    public String getDestination() {
        return destination;
    }

    public double getPrice() {
        return price;
    }

    public LocalTime getDepart() {
        return depart;
    }

    public String toString() {
        return "Train [id=" + id + ", destination=" + destination + ", price=" + price + ", depart=" + depart + "]";
    }
}