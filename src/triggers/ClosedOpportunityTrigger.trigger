trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
   
//Operation: Create a task:
//Subject: Follow Up Test Task
//WhatId: the opportunity ID (associates the task with the opportunity)
//Bulkify the Apex trigger so that it can insert or update 200 or more opportunities

List<Opportunity> oppList = new List<Opportunity>();
List<Task> taskList = new List<Task>();
    
    for (Opportunity opp : Trigger.New){
        if (opp.StageName == 'Closed Won' ){
             Task T = new Task();
    T.Type = 'Email';
    T.Subject = 'Follow Up Test Task'; //string
    
    T.WhatId = opp.Id; //record id
            taskList.add(T);
    
        
    	}
    }


    
    
        
    
}