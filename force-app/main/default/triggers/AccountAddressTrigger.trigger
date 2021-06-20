trigger AccountAddressTrigger on Account (before insert, before update) {
    //Account a1=new Account();
    for(Account a1:Trigger.New){
    if(a1.BillingPostalCode!=null && a1.Match_Billing_Address__c==true)
    {
        a1.ShippingPostalCode=a1.BillingPostalCode;
    }}

}