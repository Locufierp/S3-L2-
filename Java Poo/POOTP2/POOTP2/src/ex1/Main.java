package ex1;

public class Main {
    public static void main(String[] args) {

    Client client = new Client(1, "Dupont");
    System.out.println(client.getIdClient()+ " " + client.getNom() + " " + client.getPrenom()+ " " + client.getSociete()+ " " + client.isActif());
    Client client1 = new Client( 2,"Dupont", "Anne", "soc'" , true );
    System.out.println(client1.getIdClient() + " " + client1.getNom() + " " + client1.getPrenom() + " " + client1.getSociete() + " " + client1.isActif());
    }
}