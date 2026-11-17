import java.util.Arrays;
import java.util.Comparator;
import java.util.Scanner;

public class ListeNuplets {
    private Nuplet[] lesNuplets;

    private static class Nuplet implements Comparable<Nuplet> {
        private int[] content;

        public Nuplet(int k) {
            content = new int[k];
            Scanner sc = new Scanner(System.in);
            for (int i = 0; i < k; i++) {
                int entier = -1;
                while (entier < 0) {
                    System.out.println("rentrer le n-uplet " + i);
                    if (sc.hasNextInt()) {
                        entier = sc.nextInt();
                        if (entier < 0) {
                            System.out.println("Entier négatif entré");
                        }
                    } else {
                        System.out.println("Pas un entier");
                    }
                }
                content[i] = entier;

            }

        }

        @Override
        public String toString() {
            String text = "(";
            for (int i = 0; i < content.length; i++) {
                text += content[i];
                if (i < content.length - 1) {
                    text += ",";
                }
            }
            text += ")";
            return text;
        }

        public int getElements(int index) {
            if (index > -1 && index < nbElements() + 1) {
                return content[index];
            }
            return -1;
        }

        public int nbElements() {
            return content.length;
        }

        @Override
        public int compareTo(Nuplet nuplet) {
            int n1 = this.nbElements();
            int n2 = nuplet.nbElements();
            int len = n2;
            if (n1 < n2) {
                len = n1;
            }
            for (int i = 0; i < len; i++) {
                if (this.getElements(i) != nuplet.getElements(i)) {
                    return this.getElements(i) - nuplet.getElements(i);
                }
            }
            return n1 - n2;
        }
    }

    public ListeNuplets(int... lesTailles) {
        lesNuplets = new Nuplet[lesTailles.length];
        for (int i = 0; i < lesTailles.length; i++) {
            lesNuplets[i] = new Nuplet(lesTailles[i]);
        }
    }

    @Override
    public String toString() {
        String text = "";
        for (Nuplet i : lesNuplets) {
            text += i.toString() + "\n";
        }
        return text;
    }

    public Nuplet getNuplet(int index) {
        if (index > -1 && index < lesNuplets.length + 1) {
            return lesNuplets[index];
        }
        return null;
    }

    // on utilise compareTo je pense
    //En effet on rajoute implements Comparable<Nuplet> dans la création de classe
    public void trier() {
        Arrays.sort(lesNuplets);
    }

}
