package ex1;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        //TIP Press <shortcut actionId="ShowIntentionActions"/> with your caret at the highlighted text
        // to see how IntelliJ IDEA suggests fixing it.
    Client client = new Client();
    System.out.println(client.idclient + " " + client.nom + " " + client.prenom + " " + client. societe + " " + client.actif);
    client.nom = "dupont";
    }
}