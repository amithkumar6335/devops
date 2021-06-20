@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager 
{
    @HttpGet
    global static Account getAccount()
    {
        RestRequest request=RestContext.request;
        String AccountId=request.requestURI.substringBetween('Accounts/','/contacts');
        Account result=[SELECT Id,Name,(Select Id,Name from Contacts) from Account
                       where Id =:AccountId LIMIT 1];
        return result;    
    }

}