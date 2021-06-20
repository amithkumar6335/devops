public class ParkLocator {
    public static String[] country(String Planet)
    {
        ParkService.ParksImplPort parkimplport=new ParkService.ParksImplPort();
        return parkimplport.byCountry(Planet);
    }
    
}