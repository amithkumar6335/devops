public class ContactSearch {
    public static List<Contact>  searchForContacts(String a1, String a2)
    {
        List<Contact> l1=[SELECT Id, Name FROM contact 
                          WHERE (LastName=:a1 OR MailingPostalCode=:a2)];
        return l1;        
    }

}