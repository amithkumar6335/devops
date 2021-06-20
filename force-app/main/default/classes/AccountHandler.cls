public class AccountHandler {
    public static Account insertNewAccount(String a1)
    {
        Account a2=new Account(Name=a1);
        try
        {            
            insert a2;
        }
        catch(DmlException e)
        {
            //System.debug('A DML exception has occurred: ' +e.getMessage());
            return null;
        }
        return a2;
    }
}