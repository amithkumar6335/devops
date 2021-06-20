@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        String Planet='India';
        System.assertEquals(new List<String>{'Germany', 'India', 'Japan','United States'}, ParkLocator.country(Planet));
    }
}