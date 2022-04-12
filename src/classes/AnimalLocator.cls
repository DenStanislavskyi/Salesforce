public class AnimalLocator {
    public static String getAnimalNameById(Integer animId){
        Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+animId);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
        
// If the request is successful, parse the JSON response.
	//if(response.getStatusCode() == 200) {
    // Deserialize the JSON string into collections of primitive data types.
    	Map<String, Object> result = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
    	Map<String, Object> animal = (Map<String, Object>) result.get('animal');
 		return string.valueOf(animal.get('name'));
	//} else return null;
    }
}