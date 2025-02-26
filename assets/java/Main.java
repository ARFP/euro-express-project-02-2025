import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.time.LocalTime;


public class Main {
    public static void main(String[] args) {
        List<Trains> trains = new ArrayList<>();
        trains.add(new Trains(1, "Barcelone", 120.5, LocalTime.of(18, 30, 0)));
        trains.add(new Trains(2, "Copenhague", 150.75, LocalTime.of(20,45,00)));
        trains.add(new Trains(3, "Londres", 187.55, LocalTime.of(7, 30, 00)));
        trains.add(new Trains(4, "Naples", 135.25, LocalTime.of(9, 25, 00)));
        trains.add(new Trains(5, "Berlin", 110.6, LocalTime.of(15, 50, 00)));
        trains.add(new Trains(6, "Amsterdam", 105.8, LocalTime.of(12, 10, 00)));
        System.out.println(trains.toString());
        Reservation resa = new Reservation("toto@gmail.com", "Smith", "Toto", LocalDate.of(1990, 5, 25), LocalDateTime.of(2025, 2, 25, 19, 30, 0), trains.get(0), "Premium");
        System.out.println(resa.toString());
        Reservation resa1 = new Reservation("tata@gmail.com", "Smith", "Toto", LocalDate.of(1990, 5, 25), LocalDateTime.of(2025, 2, 26, 19, 30, 0), trains.get(0), "Premium");
        System.out.println(resa1.toString());
    }
}