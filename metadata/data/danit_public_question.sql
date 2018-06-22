INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (650, '0001', '
`        int i=3;
         if (i<5) {
             System.out.print("A");
         } if (i<10) {
             System.out.print("B");
         }`

', '2018-06-20 00:17:27.494078', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (651, '0002', '`        for (int i = 0; i < 10; i++) {
             System.out.print(i);
         }`

', '2018-06-20 00:17:27.522414', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (652, '0003', '`        int i=2;
         switch (i) {
             case 3:
                 System.out.print("3");
             case 2:
                 System.out.print("2");
             case 1:
                 System.out.print("1");
             default:
                 System.out.print("d");
         }`
', '2018-06-20 00:17:27.529905', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (653, '0004', '`        for (int i = 0; i > -10; i--) {
             System.out.print(i);
         }`

', '2018-06-20 00:17:27.536270', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (654, '0005', '`        System.out.println(5&1);`

', '2018-06-20 00:17:27.541920', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (655, '0006', '`        System.out.print(8>1);
         System.out.print(8>>1);
         System.out.print(8>>>1);
`
', '2018-06-20 00:17:27.550199', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (656, '0008', '`public class Test008 {
     public static void main(String [] args) {
         Test008 s = new Test008();
         s.start();
     }

     void start() {
         int a = 3;
         int b = 4;
         System.out.print(" " + 7 + 2 + " ");
         System.out.print(a + b);
         System.out.print(" " + a + b + " ");
         System.out.print(hello() + a + b + " ");
         System.out.println(a + b + hello());
     }

     String hello() {
         return "hello";
     }
 }
`

', '2018-06-20 00:17:27.555404', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (657, '0009', '`
    boolean [] b = new boolean[3];
    int c = 0;

    public static void main(String [] args) {
        Test009 ba = new Test009();
        ba.set(ba.b, 0);
        ba.set(ba.b, 2);
        ba.test();
    }

    void set(boolean []x, int i) {
        x[i] = true;
        ++c;
    }

    void test() {
        if ( b[0] && b[1] | b[2] )  c++;
        if ( b[1] && b[(++c - 2)] ) c+=7;
        System.out.println("c=" + c);
    }`
', '2018-06-20 00:17:27.559903', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (658, '0010', '1. 3/2
2. 3<2
3. 3*4
4. 3<<2
', '2018-06-20 00:17:27.567567', 'какие выражения эквивалентны ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (659, '0011', '`
    public static void test( boolean a, boolean b) {
        if (a) {
            System.out.println("A");
        } else if (a && b) {
            System.out.println( "A && B");
        } else {
            if (!b) {
                System.out.println( "notB") ;
            }
            else {
                System.out.println( "ELSE" ) ;
            }
        }
    }`
', '2018-06-20 00:17:27.571666', 'как поведет себя эта функция');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (660, '0012', '`
        Float f = new Float("12");
        switch (f) {
            case 12: System.out.println("Twelve");
            case 0: System.out.println("Zero");
            default: System.out.println("Default");
        }`
', '2018-06-20 00:17:27.576231', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (661, '0025', '`
public class Test025 {
    public static void stringReplace (String text) {
        text = text.replace (''j'' , ''c''); /* Line 5 */
    }

    public static void bufferReplace (StringBuffer text) {
        text = text.append ("c");  /* Line 9 */
    }

    public static void main (String args[]) {
        String textString = new String ("java");
        StringBuffer textBuffer = new StringBuffer ("java"); /* Line 14 */
        stringReplace(textString);
        bufferReplace(textBuffer);
        System.out.println (textString + textBuffer);
    }
}`

', '2018-06-20 00:17:27.582161', 'что сучится');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (662, '0026', '`
public class Test026 {
    public static void main(String [] args) {
        Boolean b1 = new Boolean("false");
        boolean b2;
        b2 = b1.booleanValue();
        if (!b2) {
            b2 = true;
            System.out.print("x ");
        }
        if (b1 & b2) /* Line 13 */ {
            System.out.print("y ");
        }
        System.out.println("z");
    }
}`

', '2018-06-20 00:17:27.586455', 'What will be the output of the program (in jdk1.6 or above)?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (663, '0027', '`
public class Test027 {
    public static void main(String[] args) {
        String s="Apple "+
                "costs " +
                + ''2'' +
                " UAH";
        System.out.println(s);
    }
}`
', '2018-06-20 00:17:27.591226', 'what will be printed');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (664, '0032', '`
public class Test032 {
    public static void main(String[] args) {
        float f1[ ], f2[ ];
        f1 = new float[10];
        f2 = f1;
        System.out.println("f2[0] = " + f2[0]);
    }
}
`

', '2018-06-20 00:17:27.595574', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (665, '0036', '`
public class Test036 {
    static boolean b1, b2;
    public static void main(String [] args) {
        int x = 0;
        if ( !b1 ) {
            if ( !b2 ) {
                b1 = true;
                x++;
                if ( 5 > 6 ) {
                    x++;
                }
                if ( !b1 )
                    x = x + 10;
                else if ( b2 = true )
                    x = x + 100;
                else if ( b1 | b2 )
                    x = x + 1000;
            }
        }
        System.out.println(x);
    }
}`

', '2018-06-20 00:17:27.600564', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (666, '0037', '`
public class Test037 {
    static boolean b;
    public static void main(String [] args) {
        short hand = 42;
        if ( hand < 50 && !b )
            hand++;
        if ( hand > 50 );
        else if ( hand > 40 ) {
            hand += 7;
            hand++;
        }
        else
            --hand;
        System.out.println(hand);
    }
}`

', '2018-06-20 00:17:27.606509', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (667, '0038', '`
public class Test038 {
    public static void main(String[] args) {
        int i = 0;
        while(1) {
            if(i == 4) {
                break;
            }
            ++i;
        }
        System.out.println("i = " + i);
    }
}
`
', '2018-06-20 00:17:27.612400', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (668, '0039', '`
public class Test039 {
    public static void main(String[] args) {
        int i = 0, j = 5;
        tp:
        for (; ; ) {
            i++;
            for (; ; ) {
                if (i > --j) {
                    break tp;
                }
            }
            System.out.println("i =" + i + ", j = " + j);
        }
    }
}`

', '2018-06-20 00:17:27.617499', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (669, '0040', '`
public class Test040 {
    public static void main(String[] args) {
        int i = 0;
        label:
        if (i < 2) {
            System.out.print("I is " + i);
            i++;
            continue label;
        }
    }
}`
', '2018-06-20 00:17:27.622543', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (672, '0052', '`
public class Test052 {
    returnType methodA(byte x, double y) {
        return (long)x / y * 2;
    }
}`

', '2018-06-20 00:17:27.636589', 'What is the widest valid returnType for methodA');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (670, '0049', '`
public class Test049 {
    public static void main(String[] args) {
        double value = -9.0;
        System.out.println( Math.sqrt(value));
    }
}`

', '2018-06-20 00:17:27.627381', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (671, '0050', '`
public class Test050 {
    public static void main(String[] args) {
        String a = "newspaper";
        a = a.substring(5,7);
        char b = a.charAt(1);
        a = a + b;
        System.out.println(a);
    }
}`

', '2018-06-20 00:17:27.632818', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (673, '0053', '
`
public class Test053 {
    public static void main(String[] args) {
        float[] f = new float(3);
        float f2[] = new float[];
        float[]f1 = new float[3];
        float f3[] = new float[3];
        float f5[] = {1.0f, 2.0f, 2.0f};
    }
}`

', '2018-06-20 00:17:27.641013', 'Which two cause a compiler error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (675, '0057', '`
public class Test057 {
    public static void main(String [] args) {
        float f = 42.0f;
        float [] f1 = new float[2];
        float [] f2 = new float[2];
        float [] f3 = f1;
        long x = 42;
        f1[0] = 42.0f;
    }
}`
1. f1 == f2
2. f1 == f3
3. f2 == f1[1]
4. x == f1[0]
5. f == f1[0]

', '2018-06-20 00:17:27.650300', 'which three statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (678, '0075', '`
public class Test075 {
    public static void main(String [] args) {
        Test075 p = new Test075();
        p.start();
    }

    void start() {
        String s1 = "slip";
        String s2 = fix(s1);
        System.out.println(s1 + " " + s2);
    }

    String fix(String s1) {
        s1 = s1 + "stream";
        System.out.print(s1 + " ");
        return "stream";
    }
}`

', '2018-06-20 00:17:27.662310', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (680, '0077', '`
public class Test077 {
    public void test(int x) {
        int odd = 1;
        if(odd) /* Line 4 */ {
            System.out.println("odd");
        } else {
            System.out.println("even");
        }
    }
}`

', '2018-06-20 00:17:27.668725', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (682, '0079', '`
public class Test079 {
    public static void main(String args[]) {
        int i = 1, j = 0;
        switch(i) {
            case 2: j += 6;
            case 4: j += 1;
            default: j += 2;
            case 0: j += 4;
        }
        System.out.println("j = " + j);
    }
}`

', '2018-06-20 00:17:27.675798', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (684, '0089', '`
public class Test089 {
    public static void main(String [] args)
    {
        int result = 0;
        Boolean b1 = new Boolean("TRUE");
        Boolean b2 = new Boolean("true");
        Boolean b3 = new Boolean("tRuE");
        Boolean b4 = new Boolean("false");
        if (b1 == b2)  /* Line 10 */
            result = 1;
        if (b1.equals(b2) ) /* Line 12 */
            result = result + 10;
        if (b2 == b4)  /* Line 14 */
            result = result + 100;
        if (b2.equals(b4) ) /* Line 16 */
            result = result + 1000;
        if (b2.equals(b3) ) /* Line 18 */
            result = result + 10000;
        System.out.println("result = " + result);
    }
}
`

', '2018-06-20 00:17:27.682557', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (688, '0096', '`
16*4
16>>2
16/2^2
16>>>2
`

', '2018-06-20 00:17:27.697702', 'Which two statements are equivalent?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (690, '0100', '`
run
import
default
implement`

', '2018-06-20 00:17:27.704781', 'Which of the following are Java reserved words?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (692, '0107', '`
public class Test107 {
    public static void main(String [] args ) {
        int result = 0;
        Test107 oc = new Test107();
        Object o = oc;
        if (o == oc)
            result = 1;
        if (o != oc)
            result = result + 10;
        if (o.equals(oc) )
            result = result + 100;
        if (oc.equals(o) )
            result = result + 1000;
        System.out.println("result = " + result);
    }
}`

', '2018-06-20 00:17:27.711269', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (694, '0109', '`
public class Test109 {
    public static void main(String[] args) {
        int i = 1, j = 10;
        do {
            if(i++ > --j) /* Line 4 */ {
                continue;
            }
        } while (i < 5);
        System.out.println("i = " + i + "and j = " + j); /* Line 9 */
    }
}`

', '2018-06-20 00:17:27.718166', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (696, '0114', '`
switch(x) {
    default:
        System.out.println("Hello");
}

byte
long
char
float
Short
Long
`

', '2018-06-20 00:17:27.726058', 'Which two are acceptable types for x?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (698, '0116', '`
public class Test116 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 3; z++) {
            switch (z) {
                case y: System.out.print("0 ");   /* Line 11 */
                case x-1: System.out.print("1 "); /* Line 12 */
                case x: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.734212', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (700, '0130', '`
The result is less than 0.0.
The result is greater than or equal to 0.0.
The result is less than 1.0.
The result is greater than 1.0.
The result is greater than or equal to 1.0.
`

', '2018-06-20 00:17:27.741879', 'What two statements are true about the result obtained from calling Math.random()?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (703, '0134', '`
class Test134 {
    public static void main(String [] args) {
        int x= 0;
        int y= 0;
        for (int z = 0; z < 5; z++) {
            if (( ++x > 2 ) && (++y > 2)) {
                x++;
            }
        }
        System.out.println(x + " " + y);
    }
}`

', '2018-06-20 00:17:27.754510', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (705, '0136', '`
for(int i = 0; i < 3; i++) {
    switch(i) {
        case 0: break;
        case 1: System.out.print("one ");
        case 2: System.out.print("two ");
        case 3: System.out.print("three ");
    }
}
System.out.println("done");`

', '2018-06-20 00:17:27.761861', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (707, '0142', '`
public class Test142 {
    public static void main (String [] args) {
        Object o = new Object() /* Line 5 */ {
            public boolean equals(Object obj) {
                return true;
            }
        };      /* Line 11 */
        System.out.println(o.equals("Fred"));
    }
}`

', '2018-06-20 00:17:27.779127', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (709, '0149', '`int i = (int) Math.random();`

', '2018-06-20 00:17:27.790011', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (710, '0152', '`
public class While {
    public void loop() {
        int x= 0;
        while ( 1 ) /* Line 6 */
        {
            System.out.print("x plus one is " + (x + 1)); /* Line 8 */
        }
    }
}`

', '2018-06-20 00:17:27.796812', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (712, '0154', '`
public class Test {
    private static float[] f = new float[2];
    public static void main (String[] args)
    {
        System.out.println("f[0] = " + f[0]);
    }
}`

', '2018-06-20 00:17:27.806145', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (714, '0186', '
', '2018-06-20 00:17:27.814662', 'Which of the following would compile without error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (716, '0190', '`Double d = Math.random();`

', '2018-06-20 00:17:27.822282', 'Which statement is true given the following?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (718, '0192', '`
class PassA
{
    public static void main(String [] args)
    {
        PassA p = new PassA();
        p.start();
    }

    void start()
    {
        long [] a1 = {3,4,5};
        long [] a2 = fix(a1);
        System.out.print(a1[0] + a1[1] + a1[2] + " ");
        System.out.println(a2[0] + a2[1] + a2[2]);
    }

    long [] fix(long [] a3)
    {
        a3[1] = 7;
        return a3;
    }
}`

', '2018-06-20 00:17:27.830769', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (853, '0124', '
', '2018-06-20 00:17:28.238183', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (674, '0056', '`
class Test056 {
    public static void main(String [] args) {
        int x=0;
        int y=0;
        for (int z = 0; z < 5; z++) {
            if (( ++x > 2 ) || (++y > 2)) {
                x++;
            }
        }
        System.out.println(x + " " + y);
    }
}`

', '2018-06-20 00:17:27.645160', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (676, '0062', '`
import java.io.File;

public class Test062 {
    public static void main(String[]args)throws Exception {
        java.io.PrintWriter out = new java.io.PrintWriter(new File("1.txt"));
        new java.io.OutputStreamWriter(System.out);
        out.println("Hello");
    }
}`

', '2018-06-20 00:17:27.654109', 'What line of code should added or removed to make this program compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (677, '0074', '`
public class Test074 {
    public static void main(String [] args) {
        Test074 p = new Test074();
        p.start();
    }

    void start() {
        boolean b1 = false;
        boolean b2 = fix(b1);
        System.out.println(b1 + " " + b2);
    }

    boolean fix(boolean b1) {
        b1 = true;
        return b1;
    }
}`

', '2018-06-20 00:17:27.658323', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (679, '0076', '`
public class Test076 {
    static int s;
    public static void main(String [] args) {
        Test076 p = new Test076();
        p.start();
        System.out.println(s);
    }

    void start() {
        int x = 7;
        twice(x);
        System.out.print(x + " ");
    }

    void twice(int x) {
        x = x*2;
        s = x;
    }
}`

', '2018-06-20 00:17:27.665683', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (681, '0078', '`
public class Test078 {
    public static void main(String[] args) {
        int i = 1, j = 10;
        do {
            if(i > j) {
                break;
            }
            j--;
        } while (++i < 5);
        System.out.println("i = " + i + " and j = " + j);

    }
}`

', '2018-06-20 00:17:27.672601', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (683, '0082', '
', '2018-06-20 00:17:27.679414', 'Which is valid declaration of a float?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (685, '0090', '`
public class Test090 {
    public static void print() {
        System.out.print("Hello World ");
    }

    public static void main(String[] args) {
        System.out.print("before ");
        Test211 t=null;
        ((Test211)t).print();
        System.out.println("after");
    }
}`

', '2018-06-20 00:17:27.685646', 'What will be happened ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (686, '0094', '`
public class Test094 {
    public static void main(String [] args) {
        int x=20;
        String sup = (x < 15) ? "small" : (x < 22)? "tiny" : "huge";
        System.out.println(sup);
    }
}`

', '2018-06-20 00:17:27.690495', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (687, '0095', '`
public class Test095 {
    public static void main(String[] args) {
        byte w = (int)888.8;
        byte x = (byte)1000L;
        long y = (byte)100;
        byte z = (byte)100L;
    }
}`

', '2018-06-20 00:17:27.694128', 'Which of the following are legal lines of code?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (689, '0097', '`
public class Test097 {
    public static void main(String [] args) {
        int i = 1;
        do while ( i < 1 )
            System.out.print("i is " + i);
        while ( i > 1 ) ;
    }
}`

', '2018-06-20 00:17:27.701013', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (691, '0101', 'And the command line invocation: java Test red green blue
`
public class Test101 {
    public static void main (String[] args) {
        String foo = args[1];
        String bar = args[2];
        String baz = args[3];
        System.out.println("baz = " + baz); /* Line 8 */
    }
}`

', '2018-06-20 00:17:27.707862', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (693, '0108', '`
public class Test108 {
    public static void main(String[] args) {
        String s = "foo";
        Object o = (Object)s;
        if (s.equals(o)) {
            System.out.print("AAA");
        } else {
            System.out.print("BBB");
        }
        if (o.equals(s)) {
            System.out.print("CCC");
        } else {
            System.out.print("DDD");
        }
    }
}`

', '2018-06-20 00:17:27.714552', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (695, '0110', '`
public class Test110 {
    static int j;
    static void methodA(int i){
        boolean b;
        do {
            b = i<10 | methodB(4); /* Line 9 */
            b = i<10 || methodB(8);  /* Line 10 */
        } while (!b);
    }

    static boolean methodB(int i) {
        j += i;
        return true;
    }

    public static void main(String[] args) {
        methodA(0);
        System.out.println( "j = " + j );
    }
}`

', '2018-06-20 00:17:27.721728', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (697, '0115', '`
public Test115 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 3; z++){
            switch (z){
                case x: System.out.print("0 ");
                case x-1: System.out.print("1 ");
                case x-2: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.729769', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (699, '0117', '`
public class Test117 {
    final static short x = 2;
    public static int y = 0;
    public static void main(String [] args) {
        for (int z=0; z < 4; z++) {
            switch (z) {
                case x: System.out.print("0 ");
                default: System.out.print("def ");
                case x-1: System.out.print("1 ");
                            break;
                case x-2: System.out.print("2 ");
            }
        }
    }
}`

', '2018-06-20 00:17:27.737678', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (701, '0131', '
', '2018-06-20 00:17:27.745872', 'Which cause a compiler error?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (702, '0132', '`
private int getArea();
public float getVol(float x);
public void main(String [] args);
public static void main(String [] args);
boolean setFlag(Boolean [] test);
`

', '2018-06-20 00:17:27.750521', 'Which three are valid method signatures in an interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (704, '0135', '`
public class Test135 {
    public static void main(String[] args) {
        int i = 1, j = -1;
        switch (i) {
            case 0, 1: j = 1; /* Line 4 */
            case 2: j = 2;
            default: j = 0;
        }
        System.out.println("j = " + j);
    }
}`

', '2018-06-20 00:17:27.758504', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (706, '0137', '`
boolean bool = true;
if(bool = false) /* Line 2 */{
    System.out.println("a");
} else if(bool) /* Line 6 */ {
    System.out.println("b");
} else if(!bool) /* Line 10 */{
    System.out.println("c"); /* Line 12 */
}
else {
    System.out.println("d");
}`

', '2018-06-20 00:17:27.766756', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (708, '0148', '`
public class Myfile {
    public static void main (String[] args) {
        String biz = args[1];
        String baz = args[2];
        String rip = args[3];
        System.out.println("Arg is " + rip);
    }
}`

', '2018-06-20 00:17:27.784069', 'Select how you would start the program to cause it to print: Arg is 2');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (711, '0153', '`
int I = 0;
    outer:
    while (true) {
        I++;
        inner:
        for (int j = 0; j < 10; j++) {
            I += j;
            if (j == 3)
                continue inner;
            break outer;
        }
        continue outer;
    }
System.out.println(I);`

', '2018-06-20 00:17:27.800426', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (713, '0180', '`
notify();
notifyAll();
isInterrupted();
synchronized();
interrupt();
wait(long msecs);
sleep(long msecs);
yield();
`

', '2018-06-20 00:17:27.810902', 'Which three are methods of the Object class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (715, '0188', '`System.out.println(Math.sqrt(-4D));`

', '2018-06-20 00:17:27.818378', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (855, '0181', '``

', '2018-06-20 00:17:28.243469', 'Which cannot directly cause a thread to stop executing?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (717, '0191', '`
public class Test
{
    public int aMethod()
    {
        static int i = 0;
        i++;
        return i;
    }
    public static void main(String args[])
    {
        Test test = new Test();
        test.aMethod();
        int j = test.aMethod();
        System.out.println(j);
    }
}`

', '2018-06-20 00:17:27.826675', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (719, '0193', '`
class Equals
{
    public static void main(String [] args)
    {
        int x = 100;
        double y = 100.1;
        boolean b = (x = y); /* Line 7 */
        System.out.println(b);
    }
}`

', '2018-06-20 00:17:27.835378', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (721, '0195', '`
class SSBool
{
    public static void main(String [] args)
    {
        boolean b1 = true;
        boolean b2 = false;
        boolean b3 = true;
        if ( b1 & b2 | b2 & b3 | b2 ) /* Line 8 */
            System.out.print("ok ");
        if ( b1 & b2 | b2 & b3 | b2 | b1 ) /*Line 10*/
            System.out.println("dokey");
    }
}`

', '2018-06-20 00:17:27.843365', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (722, '0196', '`
int x = l, y = 6;
while (y--)
{
    x++;
}
System.out.println("x = " + x +" y = " + y);`

', '2018-06-20 00:17:27.848343', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (724, '0198', '`
int x = 3;
int y = 1;
if (x = y) /* Line 3 */
{
    System.out.println("x =" + x);
}`

', '2018-06-20 00:17:27.855758', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (726, '0208', '`
try
{
    Float f1 = new Float("3.0");
    int x = f1.intValue();
    byte b = f1.byteValue();
    double d = f1.doubleValue();
    System.out.println(x + b + d);
}
catch (NumberFormatException e) /* Line 9 */
{
    System.out.println("bad number"); /* Line 11 */
}`

', '2018-06-20 00:17:27.862448', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (728, '0211', '''
public class Test211 {
    static int x;

    static boolean catch1() {
        x++;
        return true;
    }

    public static void main(String[] args) {
        x=0;
        if ((catch1() | catch1()) || catch1())
        x++;
        System.out.println(x);
    }
}''

', '2018-06-20 00:17:27.868842', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (729, '0210', '`
public class Test210 {
    public static void main(String[] args) {
        String s = "hello";
        Object o = s;
        if (o.equals(s)) {
            System.out.println("A");
        } else {
            System.out.println("B");
        }
        if(s.equals(o)) {
            System.out.println("C");
        } else {
            System.out.println("D");
        }
    }
}

A
B
C
D
`

', '2018-06-20 00:17:27.872816', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (731, '0119', '`
public class Test {
    public static void main (String args[]) {
        String str = NULL;
        System.out.println(str);
    }
}`

', '2018-06-20 00:17:27.878832', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (733, '0169', '`
class Test169 {
    public static void main(String[] args) {
        int i1 = 5;
        int i2 = 6;
        String s1 = "7";
        System.out.println(i1 + i2 + s1);
    }
}`

', '2018-06-20 00:17:27.884537', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (735, '0187', '`
String x = new String("xyz");
String y = "abc";
x = x + y;`

', '2018-06-20 00:17:27.890730', 'How many String objects have been created?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (737, '0015', '', '2018-06-20 00:17:27.897884', 'какие выражения истинны для method-local inner class');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (740, '0043', '
`class Test1 {
     public int value;
     public int hashCode() { return 42; }
 }
 class Test2 {
     public int value;
     public int hashcode() { return (int)(value^5); }
 }
`

', '2018-06-20 00:17:27.908501', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (742, '0084', '`
TreeSet map = new TreeSet();
map.add("one");
map.add("two");
map.add("three");
map.add("four");
map.add("one");
Iterator it = map.iterator();
while (it.hasNext() ) {
    System.out.print( it.next() + " " );
}`

', '2018-06-20 00:17:27.913373', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (743, '0118', '
', '2018-06-20 00:17:27.916531', 'Which collection class allows you to grow or shrink its size and provides indexed access to its elements, but whose methods are not synchronized?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (745, '0141', '`
The value returned by hashcode() is used in some collection classes to help locate objects.
The hashcode() method is required to return a positive int value.
The hashcode() method in the String class is the one inherited from Object.
Two new empty String objects will produce identical hashcodes.
`

', '2018-06-20 00:17:27.920938', 'Which of the following statements about the hashcode() method are incorrect?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (747, '0156', '`
x = 0;
if (x1.hashCode() != x2.hashCode() )  x = x + 1;
if (x3.equals(x4) )  x = x + 10;
if (!x5.equals(x6) ) x = x + 100;
if (x7.hashCode() == x8.hashCode() )  x = x + 1000;
System.out.println("x = " + x);`

', '2018-06-20 00:17:27.925149', 'Assuming that the equals() and hashCode() methods are properly implemented, if the output is "x = 1111", which of the following statements will always be true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (749, '0178', '`
package foo;
import java.util.Vector; /* Line 2 */
private class MyVector extends Vector
{
    int i = 1; /* Line 5 */
    public MyVector()
    {
        i = 2;
    }
}
public class MyNewVector extends MyVector
{
    public MyNewVector ()
    {
        i = 4; /* Line 15 */
    }
    public static void main (String args [])
    {
        MyVector v = new MyNewVector(); /* Line 19 */
    }
}`

', '2018-06-20 00:17:27.934005', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (751, '0201', '
', '2018-06-20 00:17:27.940893', 'You need to store elements in a collection that guarantees that no duplicates are stored. Which one of the following interfaces provide that capability?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (753, '0204', '`
The Iterator interface declares only three methods: hasNext, next and remove.
The ListIterator interface extends both the List and Iterator interfaces.
The ListIterator interface provides forward and backward iteration capabilities.
The ListIterator interface provides the ability to modify the List during iteration.
The ListIterator interface provides the ability to determine its position in the List.
`

', '2018-06-20 00:17:27.946755', 'Which of the following are true statements?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (755, '0020', '`
public class Test020 {
    public void one() {
        assert false; // 1
        assert false; // 2
    }

    public void two() {
        while(true) {
            assert false; // 3
        }
        assert false; // 4
    }
}`

', '2018-06-20 00:17:27.955081', 'в какой месте будет ошибка компиляции');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (757, '0022', '
A.	In an assert statement, the expression after the colon ( : ) can be any Java expression.
B.	If a switch block has no default, adding an assert default is considered appropriate.
C.	In an assert statement, if the expression after the colon ( : ) does not have a value, the assert''s error message will be empty.
D.	It is appropriate to handle assertion failures using a catch clause.
', '2018-06-20 00:17:27.961818', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (759, '0024', '`
public class NFE
{
    public static void main(String [] args)
    {
    String s = "42";
        try
        {
            s = s.concat(".5");  /* Line 8 */
            double d = Double.parseDouble(s);
            s = Double.toString(d);
            int x = (int) Math.ceil(Double.valueOf(s).doubleValue());
            System.out.println(x);
        }
        catch (NumberFormatException e)
        {
            System.out.println("bad number");
        }
    }
}`

', '2018-06-20 00:17:27.968395', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (761, '0042', '
', '2018-06-20 00:17:27.974935', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (857, '0183', '`
public class MyRunnable implements Runnable
{
    public void run()
    {
        // some code here
    }
}
`

', '2018-06-20 00:17:28.246930', 'which of these will create and start this thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (720, '0194', '`
class Bitwise
{
    public static void main(String [] args)
    {
        int x = 11 & 9;
        int y = x ^ 3;
        System.out.println( y | 12 );
    }
}`

', '2018-06-20 00:17:27.838914', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (723, '0197', '`
for (int i = 0; i < 4; i += 2)
{
    System.out.print(i + " ");
}
System.out.println(i); /* Line 5 */`

', '2018-06-20 00:17:27.852384', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (725, '0203', '
', '2018-06-20 00:17:27.859122', 'What is the numerical range of char?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (727, '0209', '`
public class Test209 {
    static int x;

    boolean catch() {
        x++;
        return true;
    }

    public static void main(String[] args) {
        x=0;
        if ((catch() | catch()) || catch())
            x++;
        System.out.println(x);
    }
}`

', '2018-06-20 00:17:27.865908', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (730, '0070', '`
String a = "ABCD";
String b = a.toLowerCase();
b.replace(''a'',''d'');
b.replace(''b'',''c'');
System.out.println(b);
`

', '2018-06-20 00:17:27.875961', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (732, '0128', '`
String x = "xyz";
x.toUpperCase(); /* Line 2 */
String y = x.replace(''Y'', ''y'');
y = y + "abc";
System.out.println(y);`

', '2018-06-20 00:17:27.881511', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (734, '0170', '`
public class StringRef {
    public static void main(String [] args) {
        String s1 = "abc";
        String s2 = "def";
        String s3 = s2;   /* Line 7 */
        s2 = "ghi";
        System.out.println(s1 + s2 + s3);
    }
}
`

', '2018-06-20 00:17:27.887549', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (736, '0014', '', '2018-06-20 00:17:27.894478', 'какие выражения действительны java.util.ArrayList?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (738, '0028', '`public class Quizz2 {
     public static void main(String[] args) {
         int[] numbers = {1,5,7,2,4};
         Queue<Integer> myQueue = new PriorityQueue<>();
         int index = 0;
         while(index < numbers.length) {
             myQueue.add(numbers[index]);
             index++;
         }
         System.out.println(myQueue);
     }
 }`

', '2018-06-20 00:17:27.901119', 'What will be printer');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (739, '0029', '`public class Quizz3 {
     public static void main(String[] args) {
         HashSet<Short> set = new HashSet<>();
         System.out.println(set.size());
         for (short i = 0; i < 100; i++) {
             set.add(i);
             set.remove(i-1);
         }
         System.out.println(set.size());
     }
 }`

', '2018-06-20 00:17:27.905012', 'What will be printed');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (741, '0061', '
', '2018-06-20 00:17:27.910807', 'You need to store elements in a collection that guarantees that no duplicates are stored and all elements can be accessed in natural order. Which interface provides that capability?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (744, '0140', '
', '2018-06-20 00:17:27.918708', 'Which interface provides the capability to store objects using a key-value pair?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (746, '0155', '`
If the equals() method returns true, the hashCode() comparison == must return true.
If the equals() method returns false, the hashCode() comparison != must return true.
If the hashCode() comparison == returns true, the equals() method must return true.
If the hashCode() comparison == returns true, the equals() method might return true.
`

', '2018-06-20 00:17:27.923087', 'Which two statements are true about comparing two instances of the same class, given that the equals() and hashCode() methods have been properly overridden?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (748, '0177', '
', '2018-06-20 00:17:27.928318', 'Which interface does java.util.Hashtable implement?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (750, '0179', '`
hashCode() doesn''t have to be overridden if equals() is.
equals() doesn''t have to be overridden if hashCode() is.
hashCode() can always return the same value, regardless of the object that invoked it.
equals() can be true even if it''s comparing different objects.
`

', '2018-06-20 00:17:27.937928', 'What two statements are true about properly overridden hashCode() and equals() methods?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (752, '0202', '
', '2018-06-20 00:17:27.943700', 'Which collection class allows you to access its elements by associating a key with an element''s value, and provides synchronization?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (754, '0013', '`
public class Test012 {
    public static void aMethod() throws Exception {
        try {
            throw new Exception();
        }
        finally {
            System.out.print("finally ");
        }
    }

    public static void main(String args[]) {
        try {
            aMethod();
        }
        catch (Exception e) {
            System.out.print("exception ");
        }
        System.out.print("finished");
    }
}`

', '2018-06-20 00:17:27.951487', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (756, '0021', '`
public class Test022 {
    public static int y;

    public static void two(int x) {
        System.out.print("two ");
        y = x;
    }

    public static int one(int z) {
        System.out.print("one ");
        return y = z;
    }

    public static void main(String [] args ) {
        int t = 0;
        assert t > 0 : one(7);
        assert t > 1 : two(8);
        System.out.println("done ");
    }
}`

', '2018-06-20 00:17:27.957760', 'что напечатает программа');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (758, '0023', '`
public class Test2
{
    public static int x;
    public static int foo(int y)
    {
        return y * 2;
    }
    public static void main(String [] args)
    {
        int z = 5;
        assert z > 0; /* Line 11 */
        assert z > 2: foo(z); /* Line 12 */
        if ( z < 7 )
            assert z > 4; /* Line 14 */

        switch (z)
        {
            case 4: System.out.println("4 ");
            case 5: System.out.println("5 ");
            default: assert z < 10;
        }

        if ( z < 10 )
            assert z > 4: z++; /* Line 22 */
        System.out.println(z);
    }
}`

', '2018-06-20 00:17:27.965446', 'which line is an example of an inappropriate use of assertions');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (760, '0041', '`
try {
    int x = 0;
    int y = 5 / x;
}
catch (Exception e) {
    System.out.println("Exception");
}
catch (ArithmeticException ae) {
    System.out.println(" Arithmetic Exception");
}
System.out.println("finished");
`

', '2018-06-20 00:17:27.971474', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (762, '0048', '`
public class Test {
    public void foo()
    {
        assert false; /* Line 5 */
        assert false; /* Line 6 */
    }
    public void bar()
    {
        while(true)
        {
            assert false; /* Line 12 */
        }
        assert false;  /* Line 14 */
    }
}`

', '2018-06-20 00:17:27.978490', 'What causes compilation to fail?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (764, '0059', '`
System.out.print("Start ");
try {
    System.out.print("Hello world");
    throw new FileNotFoundException();
}
System.out.print(" Catch Here "); /* Line 7 */
catch(EOFException e) {
    System.out.print("End of file exception");
} catch(FileNotFoundException e) {
    System.out.print("File not found");
}`

', '2018-06-20 00:17:27.984073', 'and given that EOFException and FileNotFoundException are both subclasses of IOException, and further assuming this block of code is placed into a class, which statement is most true concerning this code?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (766, '0081', '
', '2018-06-20 00:17:27.991892', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (768, '0098', '`
public class RTExcept {
    public static void throwit () {
        System.out.print("throwit ");
        throw new RuntimeException();
    }
    public static void main(String [] args) {
        try {
            System.out.print("hello ");
            throwit();
        } catch (Exception re ) {
            System.out.print("caught ");
        } finally {
            System.out.print("finally ");
        }
        System.out.println("after ");
    }
}
`

', '2018-06-20 00:17:28.002694', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (770, '0106', '
', '2018-06-20 00:17:28.010857', 'Which statement is true ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (763, '0058', '`
public class MyProgram {
    public static void main(String args[]){
        try {
            System.out.print("Hello world ");
        }
        finally {
            System.out.println("Finally executing ");
        }
    }
}`

', '2018-06-20 00:17:27.980997', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (765, '0080', '`
public class MyProgram {
    public static void main(String args[]) {
        FileOutputStream out = null;
        try {
            out = new FileOutputStream("test.txt");
            out.write(122);
        } catch(IOException io) {
            System.out.println("IO Error.");
        } finally {
            out.close();
        }
    }
}
`

', '2018-06-20 00:17:27.987120', 'and given that all methods of class FileOutputStream, including close(), throw an IOException, which of these is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (767, '0088', '`
public class Test {
    public static void main(String[] args) {
        int x = 0;
        assert (x > 0) ? "assertion failed" : "assertion passed" ;
        System.out.println("finished");
    }
}`

', '2018-06-20 00:17:27.996819', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (769, '0099', '`
public class X {
    public static void main(String[] args) {
        try {
            badMethod();
            System.out.print("A");
        } catch (Exception ex) {
            System.out.print("B");
        }
        finally {
            System.out.print("C");
        }
        System.out.print("D");
    }
    public static void badMethod() {}
}`

', '2018-06-20 00:17:28.006811', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (771, '0125', '`
public class Test {
    public static void main(String[] args) {
        int x = 0;
        assert (x > 0) : "assertion failed"; /* Line 6 */
        System.out.println("finished");
    }
}`

', '2018-06-20 00:17:28.013192', 'What will be the output of the program (when you run with the -ea option) ?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (773, '0127', '
', '2018-06-20 00:17:28.017921', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (775, '0139', '`
public class MyProgram {
    public static void throwit() {
        throw new RuntimeException();
    }

    public static void main(String args[]){
        try {
            System.out.println("Hello world ");
            throwit();
            System.out.println("Done with try block ");
        } finally {
            System.out.println("Finally executing ");
        }
    }
}`

', '2018-06-20 00:17:28.024841', 'Which answer most closely indicates the behavior of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (777, '0175', '`
public class X {
    public static void main(String [] args)
    {
        try
        {
            badMethod();
            System.out.print("A");
        }
        catch (Exception ex)
        {
            System.out.print("B");
        }
        finally
        {
            System.out.print("C");
        }
        System.out.print("D");
    }
    public static void badMethod()
    {
        throw new Error(); /* Line 22 */
    }
}`

', '2018-06-20 00:17:28.030984', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (779, '0199', '`
public class X
{
    public static void main(String [] args)
    {
        try
        {
            badMethod();
            System.out.print("A");
        }
        catch (RuntimeException ex) /* Line 10 */
        {
            System.out.print("B");
        }
        catch (Exception ex1)
        {
            System.out.print("C");
        }
        finally
        {
            System.out.print("D");
        }
        System.out.print("E");
    }
    public static void badMethod()
    {
        throw new RuntimeException();
    }
}`

', '2018-06-20 00:17:28.035727', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (781, '0207', '
', '2018-06-20 00:17:28.040711', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (783, '0031', '
', '2018-06-20 00:17:28.045447', 'Which of the following class level (nonlocal) variable declarations will not compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (785, '0034', '`
public class NewTreeSet extends java.util.TreeSet {
    public static void main(String [] args) {
        java.util.TreeSet t = new java.util.TreeSet();
        t.clear();
    }

    public void clear() {
        TreeMap m = new TreeMap();
        m.clear();
    }
}
`
1. No statement is required
2. import java.util.*;
3. import.java.util.Tree*;
4. import java.util.TreeSet;
5. import java.util.TreeMap;

', '2018-06-20 00:17:28.050560', 'which two statements, added independently at beginning of the program, allow the code to compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (787, '0044', '`
public class Test044 {
    Test044() {
        System.out.print("Aha");
    }

    class Inner {
        Inner() {
            System.out.print("Uhu");
        }

        public void go() {
            System.out.print("Exe");
        }
    }

    void makeInner() {
        (new Inner() {}).go();
    }

    public static void main (String [] args) {
        Test044 f = new Test044();
        f.makeInner();
    }
}`

', '2018-06-20 00:17:28.054852', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (788, '0051', '`public class Test { }`

', '2018-06-20 00:17:28.057152', 'What is the prototype of the default constructor?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (790, '0055', '`
public class A {
    void A() /* Line 3 */ {
        System.out.println("Class A");
    }
    public static void main(String[] args)
    {
        new A();
    }
}`

', '2018-06-20 00:17:28.061361', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (792, '0063', '
', '2018-06-20 00:17:28.065246', 'Which is true about an anonymous inner class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (794, '0071', '
', '2018-06-20 00:17:28.070337', 'You want subclasses in any package to have access to members of a superclass. Which is the most restrictive access that accomplishes this objective?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (796, '0073', '`
class A {
    protected int method1(int a, int b) {
        return 0;
    }
}`

', '2018-06-20 00:17:28.075544', 'Which is valid in a class that extends class A?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (798, '0085', '`
class Foo {
    class Bar{ }
}
class Test {
    public static void main (String [] args) {
        Foo f = new Foo();
        /* Line 10: Missing statement ? */
    }
}`

', '2018-06-20 00:17:28.080978', 'which statement, inserted at line 10, creates an instance of Bar?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (801, '0093', '`
1. The default constructor initialises method variables.
2. The default constructor has the same access as its class.
3. The default constructor invokes the no-arg constructor of the superclass.
4. If a class lacks a no-arg constructor, the compiler always creates a default constructor.
5. The compiler creates a default constructor only when there are no other constructors for the class.`

', '2018-06-20 00:17:28.089670', 'Which three statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (804, '0113', '
', '2018-06-20 00:17:28.098808', 'Which is a valid declaration within an interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (806, '0133', '`
class Super {
    public Integer getLength() {
        return new Integer(4);
    }
}

public class Sub extends Super {
    public Long getLength() {
        return new Long(5);
    }

    public static void main(String[] args) {
        Super sooper = new Super();
        Sub sub = new Sub();
        System.out.println(
        sooper.getLength().toString() + "," + sub.getLength().toString() );
    }
}`

', '2018-06-20 00:17:28.105805', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (808, '0151', '`
final abstract class Test {}
public static interface Test {}
final public class Test {}
protected abstract class Test {}
protected interface Test {}
abstract public class Test {}
`

', '2018-06-20 00:17:28.112325', 'Which two of the following are legal declarations for nonnested classes and interfaces?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (810, '0158', '
', '2018-06-20 00:17:28.117929', 'Which statement is true about a static nested class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (849, '0046', '`
class Test {
    private Demo d;
    void start()
    {
        d = new Demo();
        this.takeDemo(d); /* Line 7 */
    } /* Line 8 */
    void takeDemo(Demo demo)
    {
        demo = null;
        demo = new Demo();
    }
}
`

', '2018-06-20 00:17:28.229317', 'When is the Demo object eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (772, '0126', '`
public class Test2 {
    public static int x;
    public static int foo(int y) {
        return y * 2;
    }
    public static void main(String [] args) {
        int z = 5;
        assert z > 0; /* Line 11 */
        assert z > 2: foo(z); /* Line 12 */
        if ( z < 7 )
            assert z > 4; /* Line 14 */

        switch (z) {
            case 4: System.out.println("4 ");
            case 5: System.out.println("5 ");
            default: assert z < 10;
        }

        if ( z < 10 )
            assert z > 4: z++; /* Line 22 */
        System.out.println(z);
    }
}`

', '2018-06-20 00:17:28.015951', 'Which line is an example of an inappropriate use of assertions?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (774, '0138', '`
class Exc0 extends Exception { }
class Exc1 extends Exc0 { } /* Line 2 */
public class Test {
    public static void main(String args[]) {
        try
        {
            throw new Exc1(); /* Line 9 */
        }
        catch (Exc0 e0) /* Line 11 */
        {
            System.out.println("Ex0 caught");
        }
        catch (Exception e)
        {
            System.out.println("exception caught");
        }
    }
}`

', '2018-06-20 00:17:28.020094', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (776, '0167', '
', '2018-06-20 00:17:28.028262', 'Which of the following statements is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (778, '0176', '`
public class X
{
    public static void main(String [] args)
    {
        try
        {
            badMethod(); /* Line 7 */
            System.out.print("A");
        }
        catch (Exception ex) /* Line 10 */
        {
            System.out.print("B"); /* Line 12 */
        }
        finally /* Line 14 */
        {
            System.out.print("C"); /* Line 16 */
        }
        System.out.print("D"); /* Line 18 */
    }
    public static void badMethod()
    {
        throw new RuntimeException();
    }
}`

', '2018-06-20 00:17:28.033744', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (780, '0200', '`
public class ExceptionTest
{
    class TestException extends Exception {}
    public void runTest() throws TestException {}
    public void test() /* Point X */
    {
        runTest();
    }
}`

', '2018-06-20 00:17:28.038080', 'At Point X on line 5, which code is necessary to make the code compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (782, '0007', '`class A {
    final int get(int a, int b) { return 0; }
}
class B extends A {
    int get(int a, int b) { return 1; }
}
public class Test07{
    public static void main(String args[])
    {
        B b = new B();
        System.out.println("a=" + b.get(0, 1));
    }`

', '2018-06-20 00:17:28.043410', 'что будет распечатано при попытке выполнить следующий код?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (784, '0033', '`
class A {
    A() {}
}

class B extends A { }
`

', '2018-06-20 00:17:28.048024', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (786, '0035', '`class Two {
     byte x;
 }

 class PassO {
     public static void main(String [] args) {
         PassO p = new PassO();
         p.start();
     }

     void start() {
         Two t = new Two();
         System.out.print(t.x + " ");
         Two t2 = fix(t);
         System.out.println(t.x + " " + t2.x);
     }

     Two fix(Two tt) {
         tt.x = 42;
         return tt;
     }
 }`

', '2018-06-20 00:17:28.052459', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (789, '0054', '`
public class Test {
    public static void main(String args[]) {
        class Foo {
            public int i = 3;
        }
        Object o = (Object)new Foo();
        Foo foo = (Foo)o;
        System.out.println("i = " + foo.i);
    }
}`

', '2018-06-20 00:17:28.059046', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (791, '0060', '
', '2018-06-20 00:17:28.063154', 'Which class does not override the equals() and hashCode() methods, inheriting them directly from class Object?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (793, '0064', '`
public class MyOuter {
    public static class MyInner {
        public static void foo() { }
    }
}`

', '2018-06-20 00:17:28.067826', 'which statement, if placed in a class other than MyOuter or MyInner, instantiates an instance of the nested class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (795, '0072', '`
interface Base {
    boolean m1 ();
    byte m2(short s);
}

1. interface Base2 implements Base {}
2. abstract class Class2 extends Base { public boolean m1(){ return true; }}
3. abstract class Class2 implements Base {}
4. abstract class Class2 implements Base { public boolean m1(){ return (7 > 4); }}
5. abstract class Class2 implements Base { protected boolean m1(){ return (5 > 7) }}
`

', '2018-06-20 00:17:28.072833', 'which two code fragments will compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (797, '0083', '`
class H {
    public static void main (String[] args) {
        Object x = new Vector().elements();
        System.out.print((x instanceof Enumeration)+",");
        System.out.print((x instanceof Iterator)+",");
        System.out.print(x instanceof ListIterator);
    }
}`

', '2018-06-20 00:17:28.078689', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (799, '0091', '
', '2018-06-20 00:17:28.083306', 'Given a method in a class, what access modifier do you use to restrict access to that method to only the other members of the same class?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (800, '0092', '`
interface DoMath {
    double getArea(int rad);
}
interface MathPlus {
    double getVol(int b, int h);
}

1. class AllMath extends DoMath { double getArea(int r); }
2. interface AllMath implements MathPlus { double getVol(int x, int y); }
3. interface AllMath extends DoMath { float getAvg(int h, int l); }
4. class AllMath implements MathPlus { double getArea(int rad); }
5. abstract class AllMath implements DoMath, MathPlus { public double getArea(int rad) { return rad * rad * 3.14; } }`

', '2018-06-20 00:17:28.086581', 'which two code fragments inserted at end of the program, will allow to compile?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (802, '0111', '
', '2018-06-20 00:17:28.092397', 'What is the most restrictive access modifier that will allow members of one class to have access to members of another class in the same package?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (803, '0112', '
', '2018-06-20 00:17:28.095956', 'You want a class to have access to members of another class in the same package. Which is the most restrictive access that accomplishes this objective?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (805, '0129', '`
class Tree { }
class Pine extends Tree { }
class Oak extends Tree { }
public class Forest1 {
    public static void main (String [] args){
        Tree tree = new Pine();
        if( tree instanceof Pine )
            System.out.println ("Pine");
        else if( tree instanceof Tree )
            System.out.println ("Tree");
        else if( tree instanceof Oak )
            System.out.println ( "Oak" );
        else
            System.out.println ("Oops ");
    }
}`

', '2018-06-20 00:17:28.102663', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (807, '0150', '`
class A {
    public A(int x){}
}
class B extends A { }
public class test {
    public static void main (String args []) {
        A a = new B();
        System.out.println("complete");
    }
}`

', '2018-06-20 00:17:28.109924', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (809, '0157', '`
class Boo {
    Boo(String s) { }
    Boo() { }
}
class Bar extends Boo {
    Bar() { }
    Bar(String s) {super(s);}
    void zoo()
    {
    // insert code here
    }
}`

', '2018-06-20 00:17:28.115412', 'which one create an anonymous inner class from within class Bar?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (811, '0159', '
', '2018-06-20 00:17:28.120570', 'Which constructs an anonymous inner class instance?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (847, '0206', '`
Deadlock will not occur if wait()/notify() is used
A thread will resume execution as soon as its sleep duration expires.
Synchronization can prevent two objects from being accessed by the same thread.
The wait() method is overloaded to accept a duration.
The notify() method is overloaded to accept a duration.
Both wait() and notify() must be called from a synchronized context.
`

', '2018-06-20 00:17:28.225727', 'Which two statements are true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (812, '0160', '`
public class Test160 {
    public static void main (String [] args) {
        class Horse {
            public String name; // 1
            public Horse(String s) {
                name = s;
            }
        }
        Object obj = new Horse("Zippo"); // 2
        Horse h = (Horse) obj; // 3
        System.out.println(h.name);
    }
}`

', '2018-06-20 00:17:28.123043', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (813, '0161', '`
public abstract class AbstractTest {
    public int getNum() {
        return 45;
    }
    public abstract class Bar {
        public int getNum() {
            return 38;
        }
    }
    public static void main (String [] args) {
        AbstractTest t = new AbstractTest() {
            public int getNum() {
                return 22;
            }
        };
        AbstractTest.Bar f = t.new Bar() {
            public int getNum() {
                return 57;
            }
        };

        System.out.println(f.getNum() + " " + t.getNum());
    }
}`

', '2018-06-20 00:17:28.125879', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (815, '0171', '`
class Super{
    public int i = 0;

    public Super(String text) /* Line 4 */{
        i = 1;
    }
}

class Sub extends Super{
    public Sub(String text)
    {
        i = 2;
    }

    public static void main(String args[])
    {
        Sub sub = new Sub("Hello");
        System.out.println(sub.i);
    }
}`

', '2018-06-20 00:17:28.131172', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (816, '0172', '`
class Base
{
    Base()
    {
        System.out.print("Base");
    }
}
public class Alpha extends Base
{
    public static void main(String[] args)
    {
        new Alpha(); /* Line 12 */
        new Base(); /* Line 13 */
    }
}`

', '2018-06-20 00:17:28.134479', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (818, '0016', '`
public class X implements Runnable {
    public void run() {
        System.out.println("hello");
    }
}`
как запустить этот код ?
', '2018-06-20 00:17:28.140709', 'Есть код');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (820, '0018', '`class MyThread extends Thread {
     MyThread() {}
     MyThread(Runnable r) {super(r); }
     public void run() {
         System.out.print("Inside a Thread ");
     }
 }

 class MyRunnable implements Runnable {
     public void run() {
         System.out.print("Inside Runnable");
     }
 }

 class Test018 {
     public static void main(String[] args) {
         new MyThread().start();
         new MyThread(new MyRunnable()).start();
     }
 }
`
', '2018-06-20 00:17:28.152906', 'что будет результатом выполнения');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (822, '0065', '`
Thread(Runnable r, String name)
Thread()
Thread(int priority)
Thread(Runnable r, ThreadGroup g)
Thread(Runnable r, int priority)
`

', '2018-06-20 00:17:28.160166', 'Which two are valid constructors for Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (825, '0068', '
', '2018-06-20 00:17:28.169184', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (827, '0087', '
', '2018-06-20 00:17:28.177012', 'Which will contain the body of the thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (830, '0104', '
', '2018-06-20 00:17:28.184561', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (832, '0121', '`
public class SyncTest {
    public static void main (String [] args) {
        Thread t = new Thread() {
            Foo f = new Foo();
            public void run() {
                f.increase(20);
            }
        };
    t.start();
    }
}
class Foo {
    private int data = 23;
    public void increase(int amt) {
        int x = data;
        data = x + amt;
    }
}`

', '2018-06-20 00:17:28.189553', 'What will be the output of the program? and assuming that data must be protected from corruption, what ”if ....” can you add to the preceding code to ensure the integrity of data?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (834, '0123', '``

', '2018-06-20 00:17:28.195340', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (836, '0144', '
', '2018-06-20 00:17:28.199707', 'Which class or interface defines the wait(), notify(),and notifyAll() methods?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (838, '0146', '`
Extend java.lang.Thread and override the run() method.
Extend java.lang.Runnable and override the start() method.
Implement java.lang.Thread and implement the run() method.
Implement java.lang.Runnable and implement the run() method.
Implement java.lang.Thread and implement the start() method.
`

', '2018-06-20 00:17:28.204480', 'Which two can be used to create a new Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (840, '0162', '`
public class Q126 implements Runnable {
    private int x;
    private int y;

    public static void main(String [] args) {
        Q126 that = new Q126();
        (new Thread(that)).start( ); /* Line 8 */
        (new Thread(that)).start( ); /* Line 9 */
    }
    public synchronized void run( ) /* Line 11 */{
        for (;;) /* Line 13 */{
            x++;
            y++;
            System.out.println("x = " + x + "y = " + y);
        }
    }
}`

', '2018-06-20 00:17:28.209300', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (843, '0165', '`
public class Test165 implements Runnable {
    private int x;
    private int y;

    public synchronized void run() {
        for(int i = 0; i < 10; i++) {
            x++; y++;
            System.out.println("x = " + x + ", y = " + y);
        }
    }

    public static void main(String p[]) {
        Test165 that = new Test165();
        (new Thread(that)).start();
        (new Thread(that)).start();
    }
}`

', '2018-06-20 00:17:28.217534', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (844, '0174', '`
You can extend the Runnable interface as long as you override the public run() method.
The class must contain a method called run() from which all code for that thread will be initiated.
The class must contain an empty public void method named run().
The class must contain a public void method named runnable().
The class definition must include the words implements Threads and contain a method called run().
The mandatory method must be public, with a return type of void, must be called run(), and cannot take any arguments.
`

', '2018-06-20 00:17:28.219920', 'Which two statements are true for any concrete class implementing the java.lang.Runnable interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (846, '0205', '
', '2018-06-20 00:17:28.224072', 'Which method must be defined by a class implementing the java.lang.Runnable interface?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (848, '0045', '`
class Bar { }
class Test {
    Bar doBar() {
        Bar b = new Bar(); // 6
        return b; // 7
    }
    public static void main (String args[]) {
        Test t = new Test();  // 11
        Bar newBar = t.doBar();  // 12
        System.out.println("newBar");
        newBar = new Bar(); // 14
        System.out.println("finishing"); // 15
    }
}
`

', '2018-06-20 00:17:28.227509', 'At what point is the Bar object, created on line 6, eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (850, '0047', '`
public class X {
    public static void main(String [] args)
    {
        X x = new X();
        X x2 = m1(x); /* Line 6 */
        X x4 = new X();
        x2 = x4; /* Line 8 */
        doComplexStuff();
    }
    static X m1(X mx)
    {
        mx = new X();
        return mx;
    }
}
`

', '2018-06-20 00:17:28.231315', 'After line 8 runs. how many objects are eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (852, '0105', '
', '2018-06-20 00:17:28.235721', 'Which statement is true?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (854, '0166', '
', '2018-06-20 00:17:28.240365', 'What allows the programmer to destroy an object x?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (856, '0182', '``

', '2018-06-20 00:17:28.245220', 'Which method registers a thread in a thread scheduler?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (858, '0184', '`
void start() {
    A a = new A();
    B b = new B();
    a.s(b);
    b = null; /* Line 5 */
    a = null;  /* Line 6 */
    System.out.println("start completed"); /* Line 7 */
}
`

', '2018-06-20 00:17:28.249157', 'When is the B object, created in line 3, eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (814, '0168', '`
public class WrapTest {
    public static void main(String [] args) {
        int result = 0;
        short s = 42;
        Long x = new Long("42");
        Long y = new Long(42);
        Short z = new Short("42");
        Short x2 = new Short(s);
        Integer y2 = new Integer("42");
        Integer z2 = new Integer(42);

        if (x == y) /* Line 13 */
            result = 1;
        if (x.equals(y) ) /* Line 15 */
            result = result + 10;
        if (x.equals(z) ) /* Line 17 */
            result = result + 100;
        if (x.equals(x2) ) /* Line 19 */
            result = result + 1000;
        if (x.equals(z2) ) /* Line 21 */
            result = result + 10000;
       System.out.println("result = " + result);
    }
}`

', '2018-06-20 00:17:28.128430', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (817, '0173', '`
import java.util.*;
public class NewTreeSet2 extends NewTreeSet
{
    public static void main(String [] args)
    {
        NewTreeSet2 t = new NewTreeSet2();
        t.count();
    }
}
protected class NewTreeSet
{
    void count()
    {
        for (int x = 0; x < 7; x++,x++ )
        {
            System.out.print(" " + x);
        }
    }
}`

', '2018-06-20 00:17:28.137302', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (819, '0017', '`
public class Test017 extends Thread {
    public static void main(String [] args) {
        Test017 t = new Test017();
        t.start();
        System.out.print("one. ");
        t.start();
        System.out.print("two. ");
    }

    public void run() {
        System.out.print("Thread ");
    }
}`
', '2018-06-20 00:17:28.144116', 'что будет результатом выполнения');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (821, '0019', '`
public class Test019 implements Runnable {
    int x, y;
    public void run() {
        for(int i = 0; i < 1000; i++)
            synchronized(this) {
                x = 11;
                y = 11;
            }
        System.out.print(x + " " + y + " ");
    }

    public static void main(String args[]) {
        Test019 run = new Test019();
        Thread t1 = new Thread(run);
        Thread t2 = new Thread(run);
        t1.start();
        t2.start();
    }
}`
', '2018-06-20 00:17:28.156110', 'что напечатает программа');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (823, '0066', '`
start()
wait()
notify()
run()
terminate()
`

', '2018-06-20 00:17:28.162934', 'Which two of the following methods are defined in class Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (824, '0067', '`
1. When an interrupted exception occurs.
2. When a thread of higher priority is ready (becomes runnable).
3. When the thread creates a new thread.
4. When the stop() method is called.`

', '2018-06-20 00:17:28.166146', 'Under which conditions will a currently executing thread stop?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (826, '0086', '
`
1. yield()
2. wait()
3. notify()
4. notifyAll()
5. sleep(1000)
6. aLiveThread.join()
7. Thread.killThread()
`

', '2018-06-20 00:17:28.172164', 'Which three guarantee that a thread will leave the running state?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (828, '0102', '`
public class Test102 extends Thread {
    final StringBuffer sb1 = new StringBuffer();
    final StringBuffer sb2 = new StringBuffer();

    public static void main(String args[]) {
        final Test102 h = new Test102();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("A");
                    h.sb2.append("B");
                    System.out.print(h.sb1);
                    System.out.print(h.sb2);
                }
            }
        }.start();

        new Thread() {
            public void run() {
                synchronized(this) {
                    h.sb1.append("D");
                    h.sb2.append("C");
                    System.out.print(h.sb2);
                    System.out.print(h.sb1);
                }
            }
        }.start();
    }
}`

', '2018-06-20 00:17:28.179570', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (829, '0103', '`
class MyThread extends Thread {
    public static void main(String [] args) {
        MyThread t = new MyThread();
        Thread x = new Thread(t);
        x.start(); /* Line 7 */
    }
    public void run() {
        for(int i = 0; i < 3; ++i) {
            System.out.print(i + "..");
        }
    }
}`

', '2018-06-20 00:17:28.182102', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (831, '0120', '
', '2018-06-20 00:17:28.187114', 'Which of the following will not directly cause a thread to stop?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (833, '0122', '`
class Test122  {
static final StringBuffer sb1 = new StringBuffer();
static final StringBuffer sb2 = new StringBuffer();
public static void main(String[] args) {
    new Thread() {
        public void run() {
            synchronized(sb1) {
                sb1.append("A");
                sb2.append("B");
            }
        }
    }.start();

    new Thread() {
        public void run() {
            synchronized(sb1) {
                sb1.append("C");
                sb2.append("D");
            }
        }
    }.start(); /* Line 28 */

    System.out.println (sb1 + " " + sb2);
    }
}`

', '2018-06-20 00:17:28.192726', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (835, '0143', '
', '2018-06-20 00:17:28.197598', 'Which of the following will directly stop the execution of a Thread?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (837, '0145', '`
public class ThreadDemo {
    private int count = 1;
    public synchronized void doSomething() {
        for (int i = 0; i < 10; i++)
            System.out.println(count++);
    }
    public static void main(String[] args) {
        ThreadDemo demo = new ThreadDemo();
        Thread a1 = new A(demo);
        Thread a2 = new A(demo);
        a1.start();
        a2.start();
    }
}
class A extends Thread {
    ThreadDemo demo;
    public A(ThreadDemo td) {
        demo = td;
    }
    public void run() {
        demo.doSomething();
    }
}`

', '2018-06-20 00:17:28.201900', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (839, '0147', '`
Runnable target = new MyRunnable();
Thread myThread = new Thread(target);
`
Which of the following classes can be used to create the target, so that the preceding code compiles correctly?

', '2018-06-20 00:17:28.207058', 'The following block of code creates a Thread using a Runnable target:');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (841, '0163', '`
class MyThread extends Thread {
    public static void main(String [] args) {
        MyThread t = new MyThread(); /* Line 5 */
        t.run();  /* Line 6 */
    }

    public void run() {
        for(int i=1; i < 3; ++i)
        {
            System.out.print(i + "..");
        }
    }
}`

', '2018-06-20 00:17:28.211629', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (842, '0164', '`
public class ThreadTest extends Thread {
    public void run() {
        System.out.println("In run");
        yield();
        System.out.println("Leaving run");
    }
    public static void main(String []argv) {
        (new ThreadTest()).start();
    }
}`

', '2018-06-20 00:17:28.215038', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (845, '0189', '`
public class Test
{
    public static void main(String[] args)
    {
        final StringBuffer a = new StringBuffer();
        final StringBuffer b = new StringBuffer();

        new Thread()
        {
            public void run()
            {
                System.out.print(a.append("A"));
                synchronized(b)
                {
                    System.out.print(b.append("B"));
                }
            }
        }.start();

        new Thread()
        {
            public void run()
            {
                System.out.print(b.append("C"));
                synchronized(a)
                {
                    System.out.print(a.append("D"));
                }
            }
        }.start();
    }
}`

', '2018-06-20 00:17:28.222219', 'What will be the output of the program?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (851, '0069', '`
public Object m() {
    Object o = new Float(3.14F);
    Object[] oa = new Object[l];
    oa[0] = o; /* Line 5 */
    o = null;  /* Line 6 */
    oa[0] = null; /* Line 7 */
    return o; /* Line 8 */
}`

', '2018-06-20 00:17:28.233524', 'garbage collector');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (859, '0185', '`
class X2
{
    public X2 x;
    public static void main(String [] args)
    {
        X2 x2 = new X2();  /* Line 6 */
        X2 x3 = new X2();  /* Line 7 */
        x2.x = x3;
        x3.x = x2;
        x2 = new X2();
        x3 = x2; /* Line 11 */
        doComplexStuff();
    }
}`

', '2018-06-20 00:17:28.251335', 'after line 11 runs, how many objects are eligible for garbage collection?');
INSERT INTO public.question (q_id, q_number, q_text, q_date_add, q_header) VALUES (860, '0030', '`
public class Quizz5 {
    public static void main(String[] args) {
        ArrayList<Integer> a = new ArrayList<>();
        System.out.println(a.getClass().getSimpleName());

        Set<Integer> s = new HashSet<Integer>();
        System.out.println(s.getClass().getSimpleName());

        Map<Integer, String> x1 = new HashMap<>();
        System.out.println(x1.getClass().getSimpleName());

        Map<Integer, String> x = new HashMap<Integer, String>() {{
            put(1, "A");
            put(2, "B");
            put(3, "C");
        }};
        System.out.println(x.getClass().getSimpleName());
        System.out.println(x.getClass().getName());
        Map<Integer, String> x2 = new HashMap<Integer, String>() {{
            put(1, "A");
            put(2, "B");
            put(3, "C");
        }};
        System.out.println(x2.getClass().getName());
    }
}`', '2018-06-20 00:17:28.254022', 'What will be printed');