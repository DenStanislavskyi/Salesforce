public class AddPrimaryContact implements Queueable {
    private Contact contact;
    private String state;
    public AddPrimaryContact (Contact inputContact, String inputState){
        this.contact = inputContact;
        this.state = inputState;
    }
    
    public void execute(QueueableContext context){
        List<Account> accounts = [select id from account where billingstate = :state limit 200];
        List<Contact> contacts = new List<Contact>();
              
		for (Account acc : accounts) {
            Contact contactClone = contact.clone();
            contactClone.AccountId = acc.Id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}