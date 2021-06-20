public class SampleApex {
    public static void samplemethod()
    {
        List<String> a1=new List<String>{'blue', 'green', 'orange'};
        List<String> a2=new List<String>();
        
        a2.add('pink');
        a2.add('black');
        a2.add('white');
        a2.add('green');
        String a3=a2.get(0);
        String a4=a2[0];
        if(a3.equals(a4))
        {
            system.debug('Both are equal');
        }
        else
        {
            system.debug('both are not equal');
        }
        a1.addAll(a2);
        system.debug('List Elements are '+a1);
        set<String> a5=new set<String>();
        for(String str :a1)
        {
            a5.add(str);
        }
        system.debug('Set Elements are' +a5);
       
    }

}