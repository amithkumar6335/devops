public class accountspaginationclass {
    
    Public Integer size{get;set;}
    Public Integer noOfRecords{get; set;}
    public List<SelectOption> paginationSizeOptions{get;set;}
    public static final Integer QUERY_LIMIT = 10000;
    public static final Integer PAGE_SIZE = 6;
    public List <WrapperClass> wrapperRecordList{get;set;}
    Map<Id, WrapperClass> mapHoldingSelectedRecords{get;set;}
    
    //constructor calling init method.
    public accountspaginationclass(){
        mapHoldingSelectedRecords = new Map<Id, WrapperClass>();
        init();
    }
    //Init method which queries the records from standard set controller.
   public void init() {
       wrapperRecordList = new List<WrapperClass>();
       for (Account acc : (List<Account>)setCon.getRecords()) {
           if(mapHoldingSelectedRecords != null && mapHoldingSelectedRecords.containsKey(acc.id)){
               wrapperRecordList.add(mapHoldingSelectedRecords.get(acc.id));
           }
           else{
               wrapperRecordList.add(new WrapperClass(acc, false));
           }
       }
   }
    /** Instantiate the StandardSetController from a query locater*/
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                String query='select id, Name,rating,industry,type from Account LIMIT : QUERY_LIMIT';
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(query));
                setCon.setPageSize(PAGE_SIZE);
            }
            return setCon;
        }
        set;
    }
    /** returns the previous page of the page set*/
    public void previous() {
        updateSearchItemsMap();
        setCon.previous();
        init();
    }
    /** returns the next page of the page set*/
    public void next() {
        updateSearchItemsMap();
        setCon.next();
        init();
    }
    //This is the method which manages to remove the deselected records, and keep the records which are selected in map
    public void updateSearchItemsMap() {
        for(WrapperClass wrp : wrapperRecordList){
            if(wrp.isSelected){
                mapHoldingSelectedRecords.put(wrp.AccountRecord.id, wrp);
            }
            if(wrp.isSelected == false && mapHoldingSelectedRecords.containsKey(wrp.AccountRecord.id)){
                mapHoldingSelectedRecords.remove(wrp.AccountRecord.id);
            }
        }
    }
    /*wrapper class being used for checkbox showing.*/
    public class WrapperClass {
        public Boolean isSelected {get;set;}
        public Account AccountRecord {get;set;}
        public WrapperClass(Account AccountRecord, Boolean isSelected) {
            this.AccountRecord = accountRecord;
            this.isSelected = isSelected;
        }
    }
}