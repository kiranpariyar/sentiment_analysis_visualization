package grailswebapp

class GraphController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        redirect(action: "statistics")
    }

    def statistics(){
        def now = new Date()
        def lastweek = now -7
        def count = tweetStatisticsService.getLastWeekDataForPieChart(lastweek,now,session.brandSession)
        def map = tweetStatisticsService.getLastWeekDataForOtherChart(lastweek,now,session.brandSession)

        [count:count, map:map]
    }

    def dateStatistics(){
        def date1 = params.mydate1
        def date2 = params.mydate2
        println(date1)
        println(date2)

        def count = tweetStatisticsService.getDataFromStartToEndDateForPieChart(date1,date2,"samsung")
        def map = tweetStatisticsService.getDataFromStartToEndDateForOtherChart(date1,date2,"samsung")

        println(count)
        println(map)

        [count:count,map: map]
    }
}
