trigger ParentProcessor on Parent__c (after insert) {
    Integer i,monthsbetween;
    List<Child__c > child=new List<Child__c>();
    for(Parent__c parent : Trigger.New){
        monthsbetween = parent.Start_Date__c.monthsBetween(parent.End_Date__c);
        Decimal amount1=parent.Amount__c/monthsbetween;
        for(i=0;i<monthsbetween;i++)
        {
            Child__c  child2=new Child__c();
            child2.Name=parent.Name +i;
            child2.Amount__c=amount1;
            child.add(child2);
        }}
    system.debug('@@@@@@@@@@   ' +child);
        insert child;
}