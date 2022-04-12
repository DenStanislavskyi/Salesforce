@RestResource(urlMapping='/Accounts/*/contacts')
global with sharing class AccountManager {
    @HttpGet
    global static Account getAccount(){      
      RestRequest request = RestContext.request;
    
      String accId =
          request.requestURI.substringBetween('Accounts/','/contacts');
      Account result =  [SELECT Id, Name, (SELECT Contact.Id, Contact.Name FROM Contacts)
                        FROM Account
                        WHERE Id = :accId];
        return result;        
    }
}