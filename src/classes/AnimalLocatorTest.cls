@isTest
private class AnimalLocatorTest {
    @isTest
    static void shouldLocateAnimal(){
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

    String actualValue = AnimalLocator.getAnimalNameById(1);
    String expectedValue = 'cat';
   
    System.assertEquals(expectedValue, actualValue);
    }
}