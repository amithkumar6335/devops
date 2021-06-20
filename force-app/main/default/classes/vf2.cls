public class vf2 {
    //public Account c{get;set;}
    public String nameVal{get;set;}
    public String phoneVal{get;set;}
    public String ratingVal{get;set;}
    public vf2()
    {
        nameVal= ApexPages.currentPage().getParameters().get('name');
        system.debug('Name is ' +nameVal);
        ratingVal= ApexPages.currentPage().getParameters().get('rating');
        phoneVal= ApexPages.currentPage().getParameters().get('phone');
    }
    public void save()
    {
        Account c = new Account();
        c.name=nameVal ;
        system.debug('Name is ' + c.Name);
        c.rating=ratingVal ;
        c.phone= phoneVal;
        insert c;
    }

}