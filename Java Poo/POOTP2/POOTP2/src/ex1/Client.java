package ex1;

public class Client {
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

    public Client(int idClient, String nom) {
        this.idClient = idClient;
        this.nom = nom;
    }

    public Client(int idClient, String nom, String prenom, String societe, boolean actif) {
        this(idClient , nom );
        this.prenom = prenom;
        this.societe = societe;
        this.actif = actif;
    }


    }