public class NewCaseListController {
     List <Case> NewCases =[SELECT Id, CaseNumber FROM Case WHERE Status ='New'];
     public list <Case> getNewCases()
     {
         return NewCases;
     }     
}