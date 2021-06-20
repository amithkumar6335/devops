public class StringArrayTest {
    public static List<String> generateStringArray(Integer n)
    {
        List<String> a1=new List<String>();
        for(Integer i=0;i<n;i++)
        {
            String a2='Test '+ i;
            a1.add(a2);
        }
        return a1;
    }

}