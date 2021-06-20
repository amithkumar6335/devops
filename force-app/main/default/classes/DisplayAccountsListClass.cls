public class DisplayAccountsListClass {
    
    public List<wrapAccount> wrapAccountList {get; set;}
    //public ApexPages.StandardSetController con{get; set;} 
    
    public DisplayAccountsListClass(){
        if(wrapAccountList == null) {
            wrapAccountList = new List<wrapAccount>();
            for(Account a: [select id, Name,rating,industry,type from Account]) {
                wrapAccountList.add(new wrapAccount(a));
            }
        }       
    }
     
    public class wrapAccount {
        public Account acc {get; set;}
        public Boolean selected {get; set;}
        public wrapAccount(Account a) {
            acc = a;
            selected = false;
        }
    }
    Public void DeleteSelectedRecs(){
      List<sObject> DeleteList = New List<sObject>();
      for(wrapAccount wc:wrapAccountList){
          if(wc.selected  == true)
             DeleteList.add(wc.acc); 
      }
        if(DeleteList.size()>0)
        {
      delete DeleteList;
        }
    } 
    
}