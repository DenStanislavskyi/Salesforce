@isTest 
public class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        
         for (Integer i = 0; i < 100; i++) {
             if (i < 50){
                accounts.add(new Account(
                name='Test Account'+i, 
                BillingState = 'CA'
            ));
             }
             else {
                accounts.add(new Account(
                name='Test Account'+i, 
                BillingState = 'NY'
            ));
             }
        }
      
        insert accounts;
        Contact contact = new Contact(FirstName = 'Den', LastName = 'S');
        insert contact;
    }
    @isTest public static void testQueueable(){
        List<Account> accounts = [select id, name, BillingState from account where name like 'Test Account%'];
        // query for test data to pass to queueable class
        Contact contact = [select id, LastName from contact where FirstName like 'Den' limit 1];
      
        AddPrimaryContact updater = new AddPrimaryContact(contact, 'CA');
        
        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();
        
        List<Contact> contacts = [select id from contact where Contact.Account.BillingState ='CA'];
        System.assertEquals(50, contacts.size());
    }

}