global class Email2Lead implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email, Messaging.InboundEnvelope env) {
        
        //Do not worry about this. result returned only for Salesforce Email Service process

        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        
        //Instantiate New Lead Object
        Lead newLead = new Lead();
        
        //add details
        newLead.email = email.fromAddress;
        newLead.LastName = 'Email2Lead';
        newLead.company = 'Email2Lead';
        
        //insert new lead
        
        try {
            //Insert New Lead
            Database.insert(newLead);
        }
        catch(Exception e) {
            System.debug('Exception in new Email2Lead'+e);
        }

        return result;
        
        
    }
}