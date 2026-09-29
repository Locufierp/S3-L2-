package ex1;

public class ClientBis {
    private int idClient;
    private String nom;
    private String prenom;
    private String societe;
    private boolean actif;

    public int getIdClient()  {
        return idClient;
    }
    public String getNom() {
        return nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public String getSociete() {
        return societe;
    }

    public boolean isActif() {
        return actif;
    }

    private static int idsuivant = 1;

    public ClientBis(String nom) {
        this.idClient=++idsuivant;
        this.nom = nom;
    }

    public ClientBis( String nom, String prenom, String societe, boolean actif) {
        this( nom);
         this.prenom = prenom;
         this.societe = societe;
         this.actif = actif;
    }


    }