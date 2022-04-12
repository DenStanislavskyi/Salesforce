@isTest
public class ParkLocatorTest {
    @isTest static void sholdCalloutToParkService(){
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String x = 'Ukraine';
        List<String> expected = new List<String> {'Yaje', 'Miko Lake'};
        
        List<String> result = ParkLocator.country(x);
        // Verify that a fake result is returned
        System.assertEquals(expected, result); 
        
    }
}