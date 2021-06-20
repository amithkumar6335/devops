global class Accountsupdated implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext Bc)
    {
        String query='select id,name from account where CreatedDate=YESTERDAY ';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext Bc,List<Account> acc)
    {
        if(acc.size()>0)
        {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'amithkumar1592@gmail.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject('Daily Mail about number of records created ' );
        mail.setPlainTextBody(acc.size() +'records have been created');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        }
    }
    global void finish(Database.BatchableContext Bc)
    {
       
        

    }

}