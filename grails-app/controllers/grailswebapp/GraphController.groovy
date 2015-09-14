package grailswebapp

import java.text.SimpleDateFormat

class GraphController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        redirect(action: "statistics")
    }

    def statistics(){

        String brandName = params.brand
        println(brandName)
        Date now
        Date lastweek
        def count
        def map
        def brandList


        if(brandName.equals(null)){
            brandName = session.brand
            now = new Date()
            lastweek = now -7
            count = tweetStatisticsService.getLastWeekDataForPieChart(lastweek,now,brandName)
            map = tweetStatisticsService.getLastWeekDataForOtherChart(lastweek,now,brandName)
            brandList = Brand.list()

        }else{
            session.brand = brandName
            println(brandName)
            String date1 = params.mydate1
            String date2 = params.mydate2
            println("date1 = " + date1)
            println("date2 = " + date2)
            println("name = " + brandName)
            count = tweetStatisticsService.getDataFromStartToEndDateForPieChart(date1,date2,brandName)
            map = tweetStatisticsService.getDataFromStartToEndDateForOtherChart(date1,date2,brandName)
            brandList = Brand.list()
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
            lastweek = formatter.parse(date1)
            now = formatter.parse(date2)

        }

        println(count)

        [count:count, map:map, brandList:brandList, brandName:brandName,startDate:lastweek,endDate:now]
    }

    def dateStatistics(){
        String brandName = params.brand

        if(brandName.equals(null)){
            brandName = "android"
        }
        String date1 = params.mydate1
        String date2 = params.mydate2
//        println(date1)
//        println(date2)


        def count = tweetStatisticsService.getDataFromStartToEndDateForPieChart(date1,date2,brandName)
        def map = tweetStatisticsService.getDataFromStartToEndDateForOtherChart(date1,date2,brandName)
        def brandList = Brand.list()
//        println(count)
//        println(map)

        [count:count, map:map, brandList:brandList, brandName:brandName]
    }
}
