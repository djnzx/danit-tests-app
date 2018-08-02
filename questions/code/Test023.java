public class Test023 {
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
    }}
