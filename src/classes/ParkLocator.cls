public class ParkLocator {
    public static List<String> country(String country){
        ParkService.ParksImplPort parkSvc = new ParkService.ParksImplPort();
        return parkSvc.byCountry(country);
    }
}