@IsTest
private class AccountManagerTest {
    
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri = '/Accounts/'+ recordId +'/contacts';
            
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account thisAcc = AccountManager.getAccount();
        System.assert(thisAcc != null);
        System.assertEquals('Test record', thisAcc.Name);

     }
    // Helper method
    	static Id createTestRecord() {
        
        Account accTest = new Account(
            Name='Test record');
        insert accTest;
        
        Contact con = new Contact(
        FirstName='Joe',
        LastName='Smith',
        AccountId=accTest.Id);
    	insert con;
            
        return accTest.Id;
    }          
}