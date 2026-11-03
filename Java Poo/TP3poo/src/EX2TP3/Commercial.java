package EX2TP3;

public class Commercial extends Employe {

    @Override
    public double calculerSalaireBrutMensuel() {
        return super.calculerSalaireBrutMensuel()
            + ventesDernierMois*5/100;
    }
    public String toString() {
        return"L'employé est un commercial "+
                super.toString()+"ses ventes du dernier mois : " +
                ventesDernierMois+"\n ;";
    }
}
