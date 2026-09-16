public class Main {
    public static void main(String[] args) {
        //ex1
        byte b1 = (byte) 159;
        byte b2 = 45;
        byte b = 2;
        short s1 = 3000;
        int s2 = 35000;
        int s3 = b2 + s1;
        int i = 5;
        int n = 60000;
        long q = 1500000;
        float f = 25.7f;
        float x = 34.67834E4f;
        double y = 657.52E3;
        double z = 0.1;
        //a
        //b
        int t1 = b2 + s1;
        double t2 = b2 / 2.0;
        int t3 = b2 / 2;
        int t4= b2 % 2;
        int t5 = b2 % 2 + n;
        double t6 = q * (b2 + s1);
        double t7 = q * (b2 + s1) / n;
        double t8 = x * n / q;
        long t9 = s1 + q / n;
        float u1 = s1 + q / x;
        double u2 =2.0/0;
        System.out.println(u2);
        double u3 = y / 0;
        double u4 = b2 * q * 2. / x;
        double u5 = b1 * q * 2.f / y;
        int u6 = i++ * n + b2;
        int u7 = i++ * (n + b2);
        //c
        int n1 = s1;
        byte v= (byte) (b*b);
        float x1 = n;
        int n2 = (int) x;
        int n3 = (int) y;
        float x2 = (float) y;
        //d
        System.out.println((z + z + z) == 0.3 );
        //ex2
        char c = 50;
        char d = 'i';
        char e = 'k';
        byte b4 = 20;

        int f2 = c+1;
        int g = 2*c;
        double h = e-d;
        double j = b4*c;
        int v2=d;
        int w=e;
        //ex3
        int n4 = 3;
        int p = 5;
        int q1 = 7;
        //
        p=q1++;
        n4=--p;

        if (n%2==0) {
            n4 = --q1;
        }else {
            n4 = --p;
            //n4 = n % 2 == 0 ? --q : --p;
        }

        }
        //ex4

        //ex5
    int a=3;
    int b=4;
    int c=3;

    //rectangle
    }