package EX2TP3;

import java.time.LocalDate;

public class Employe {


    private int matricule;
    private static int compteur = 1;
    private String nom;


    private double salaireDeBase;
    private LocalDate dateEmbauche;

    public Employe(double salaireDeBase, String nom, LocalDate dateEmbauche) {
        matricule = compteur++;
        this.salaireDeBase = salaireDeBase;
        this.nom = nom;
        this.dateEmbauche = dateEmbauche;
    }

    public String getNom() {
        return nom;
    }

    public double calculersalairebrutmensuel() {

        double salairebrut=0.0;
        if(java.time.temporal.ChronoUnit.YEARS.between (dateEmbauche, LocalDate.now())>=3){
            salairebrut += salaireDeBase * 0.04;
            }
        if(java.time.temporal.ChronoUnit.YEARS.between (dateEmbauche, LocalDate.now())>=6){
           salairebrut += salaireDeBase * 0.07;
           }
        if(java.time.temporal.ChronoUnit.YEARS.between (dateEmbauche, LocalDate.now())>=9){
             salairebrut += salaireDeBase * 0.1;
         }
    return salairebrut;
    }

    @Override
    public String toString() {
        return "Employe{" +
                "matricule=" + matricule +
                ", nom='" + nom + '\'' +
                ", salaireDeBase=" + salaireDeBase +
                ", dateEmbauche=" + dateEmbauche +
                '}';


    }
}
