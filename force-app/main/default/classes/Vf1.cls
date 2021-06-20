public with sharing class Vf1 {
    public Account p{ get; set;}
    public Vf1(){
        p=new Account();
    }
    public PageReference nextpage()
    {
        PageReference pr=new PageReference ('/apex/vf2?name='+p.name+'&rating='+p.rating+'&phone='+p.phone);
        pr.setRedirect(true);
        system.debug('account name: '+p.name+' rating: '+p.rating+' phone: '+p.phone);
        return pr;
    }

}