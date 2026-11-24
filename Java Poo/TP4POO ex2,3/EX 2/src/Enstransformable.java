public class Enstransformable {
    private Object[] ens;

    public Enstransformable(Object[] ens) {

        this.ens = ens;
    }

    public void transformer(Transformation f) {
        for (int i = 0; i < ens.length; i++)
            ens[i] = f.transforme(ens[i]);


    }

    public String toString() {
        String s = "";
        for (int i = 0; i < ens.length; i++) {
            s = s + ens[i] + "\n";
        }
    return s;

    }
}
