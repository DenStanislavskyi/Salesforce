Public class NewCaseListController {
List<Case> results = new List<Case>();


private String sortOrder = 'CaseNumber';
public List<Case> getNewCases() {
    results = [SELECT Id, CaseNumber FROM Case WHERE status = 'new'];

    return results;
    }
}