package ex2;

public class Temps {
    private long heures;
    private int minutes;
    private int secondes;

    public Temps(long heures, int minutes, int secondes) {
        this.heures = heures;
        this.minutes = minutes;
        this.secondes = secondes;


    }
    public Temps(long t) {
        this.heures = 0;
        this.minutes = 0;
        this.secondes = (int) t;
    }
    public void normaliser() {
        secondes= secondes%60;
        ;
        minutes = minutes%60;
        heures= heures;





    }
}
