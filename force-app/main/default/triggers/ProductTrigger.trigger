trigger ProductTrigger on Overall_Product_Value__c (before insert) {
     Integer i,monthsbetween;
    List<Monthly_Installment__c > child=new List<Monthly_Installment__c>();
    for(Overall_Product_Value__c parent : Trigger.New)
    {
        monthsbetween = parent.Start_Date__c.monthsBetween(parent.End_Date__c);
        monthsbetween=monthsbetween+1;
        Decimal amount1=(parent.Amount__c/monthsbetween);
        for(i=0;i<monthsbetween;i++)
        {
            Monthly_Installment__c  child2=new Monthly_Installment__c();
            child2.Name=parent.Name +i;
            child2.Amount__c=amount1;
            Integer year1=parent.Start_Date__c.year();
            Integer month1=parent.Start_Date__c.month();
            Integer t1=date.daysInMonth(year1, month1+i);
            Date d1=date.newInstance(year1,month1+i,1);
            Date d2=date.newInstance(year1,month1+i,t1);
            child2.Start_Date__c=d1;
            child2.End_Date__c=d2;
            child.add(child2);
        }}
        insert child;
}