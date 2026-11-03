package EX2TP3;

import java.time.LocalDate;

public class Responsable extends Employe {
    private String titre;
    private Employe[] lesSubordonnes;
    private int pourcentagePrime;

    public Responsable(String nom, double salaireBase, LocalDate dateEmbauche, String titre, int pourcentagePrime, Employe... lesSubordonnes){
        super ( salaireBase , nom , dateEmbauche);
        this.lesSubordonnes = lesSubordonnes;
        this.pourcentagePrime=pourcentagePrime;

    }

    @Override
    public String toString() {
        String s= "L'employé est un responsable : " + titre + " " + super.toString()
        + "\n Ses subordonnées directs \n";
        for (Employe e : lesSubordonnes){
            s += e.getNom() + "\n" ;
        }
        return s;
    }

    @Override
    public double calculerSalaireBrutMensuel(){
        return super.calculerSalaireBrutMensuel() +
                this.getSalaireDeBase() + pourcentagePrime /100;
    }
}
