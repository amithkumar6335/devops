public class SampleEg {
    public static void SampleClass()
    {
        List<Contact> l1=[select id,accountId,name from Contact where accountId!=null];
        List<Id> l2=new List<Id>();
        Set<Id> l3=new Set<Id>();
        for(Contact c:l1)
        {
            Id i1=c.accountId;
            l2.add(i1);
            l3.add(i1);
        }
        system.debug('size of Contact List is '+l2.size());
        system.debug('size of Contact List is '+l3.size());
        List<Account> accountList = [Select id, name from account where id =: l2];
        system.debug('Size of list '+accountList.size());
		Map<Id,Account> m1=new Map<Id,Account>();
        for(Account a:accountList)
        {
            m1.put(a.id,a);
        }
        system.debug('Account Map is '+m1.size());
        Map<Id,Account> m2=new Map<Id,Account>([Select id, name from account 
                                                where id =: l2]);
        for(Account a:m2.values())
        {
            system.debug('account name '+a.Name);
        }
        
    }

}