import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.util.concurrent.atomic.AtomicInteger;

public class Reservation {
    private static final AtomicInteger ID_FACTORY = new AtomicInteger();
    private int idReservation;
    private String email;
    private String nom;
    private String prenom;
    private LocalDate dateNaissance;
    private LocalDateTime dateReservation;
    private Trains train;
    private String classe;
    private double prix;

    public Reservation(String email, String nom, String prenom, LocalDate dateNaissance, LocalDateTime dateReservation, Trains train, String classe) {
        this.idReservation = ID_FACTORY.getAndIncrement();
        this.email = email;
        this.nom = nom;
        this.prenom = prenom;
        this.dateNaissance = dateNaissance;
        this.dateReservation = dateReservation;
        if (dateReservation.isAfter(LocalDateTime.of(LocalDate.now(), train.getDepart()))) {
            throw new IllegalArgumentException("La date et l'heure de réservation ne peut pas être postérieur à la date et l'heure de départ du train.");
        }
        this.train = train;
        this.classe = classe;
        this.prix = setPrice(train);
    }

    public int getIdReservation() {
        return idReservation;
    }

    public String getEmail() {
        return email;
    }

    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public LocalDate getDateNaissance() {
        return dateNaissance;
    }

    public LocalDateTime getDateReservation() {
        return dateReservation;
    }

    public double getPrix() {
        return prix;
    }

    public String getClasse() {
        return classe;
    }

    public Trains getTrain() {
        return train;
    }

    public String toString() {
        return "Reservation [idReservation=" + idReservation + ", email=" + email + ", nom=" + nom + ", prenom=" + prenom + ", dateNaissance=" + dateNaissance + ", dateReservation=" + dateReservation + ", prix=" + prix + ", classe=" + classe + "]";
    }   

    public double setPrice(Trains train) {
        prix = train.getPrice();
        LocalDate date = LocalDate.now();
        int age = Period.between(dateNaissance, date).getYears();
        if (classe.equalsIgnoreCase("Premium")) {
            this.prix *= 1.25;
        } else if (classe.equalsIgnoreCase("Business")) {
            this.prix *= 1.50;
        }
        if (age < 15 || age > 60) {
            this.prix *= 0.70;
        }
        return prix;
    }
}