public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String a1)
    {
        List<List<sObject>> conleads=[FIND :a1 IN ALL FIELDS 
                   RETURNING Contact(FirstName,LastName),Lead(FirstName,LastName)];
        return conleads;
    }

}