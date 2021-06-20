trigger AccessCard on Access_Card__c (before insert)
{
    List<String> acUserList = new List<String>();
    for(Access_Card__c acc1 : trigger.new){
    	String userassigned=acc1.Candidate_Assigned__c;
        system.debug('the userassigned is ' + userassigned);
        acUserList.add(userassigned);
    }
  
    List<Access_Card__c> accesscard=[Select Candidate_Assigned__c from Access_Card__c where Candidate_Assigned__c In : acUserList];
    system.debug('the accessCard is ' + accesscard);
    Integer size1=accesscard.size();
    system.debug('access card size '+size1);
    for(Access_Card__c acard:Trigger.New)
    {
         if(size1>0){
             acard.adderror('You cant insert the record');
         }
    }
                                 }