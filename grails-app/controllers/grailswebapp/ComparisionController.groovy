package grailswebapp

class ComparisionController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        def brandList = Brand.list()
        [brandList:brandList]
    }

    def compare(){
        String brandName1 = params.brand1
        String brandName2 = params.brand2

        println("brand 1 " + brandName1)
        println("brand 2 " + brandName2)

        def now = new Date()
        def startDate = now- 7
        def count1 = tweetStatisticsService.getLastWeekDataForPieChart(startDate,now,brandName1)
        def count2 = tweetStatisticsService.getLastWeekDataForPieChart(startDate,now,brandName2)
        def map1 = tweetStatisticsService.getLastWeekDataForOtherChart(startDate,now,brandName1)
        def map2 = tweetStatisticsService.getLastWeekDataForOtherChart(startDate,now,brandName2)
        def brandList = Brand.list()

       /* def positive1 = count1.get(2)
        def negative1 = count1.get(0)

        double posByNeg1 = (double) positive1/negative1

        def positive2 = count2.get(2)
        def negative2  = count2.get(0)

        double posByNeg2 = (double) positive2/negative2

        def map3 = tweetStatisticsService.getDataForComparision(startDate,now,brandName1)
        println(map3)
        [brandName1:brandName1,count1:count1,posByNeg1:posByNeg1,brandName2:brandName2,
         count2:count2,posByNeg2:posByNeg2,map1:map1,map2:map2,brandList:brandList]
        */

        [brandName1:brandName1,count1:count1,brandName2:brandName2,
         count2:count2,map1:map1,map2:map2,brandList:brandList]
    }
}
