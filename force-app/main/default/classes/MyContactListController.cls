public class MyContactListController {
    @AuraEnabled
    public static List<Contact> getContacts(Id recordId)
    {
        return [Select Id, FirstName, LastName, Email, Phone from Contact where AccountId= :recordId];
    }

}