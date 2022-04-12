trigger NewOrderTask on Shipping_order__c (after insert) {
	
  
    List<Task> taskList = new List<Task>();
    
    for(Shipping_order__c shOrder : Trigger.new){
      
            tasklist.add(new Task(Subject = 'New order task from ' + shOrder.Customer__c,
                                  WhatId = shOrder.Customer__c,
                                  Status = 'In Progress',
                                  Priority ='Normal'));  
        }
   

  if(taskList.size()>0)      
  {
      insert tasklist;
  }
        
}