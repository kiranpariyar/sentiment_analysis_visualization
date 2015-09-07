package grailswebapp


class HomeController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        def now = new Date()
        def lastweek = now -7
        def count = tweetStatisticsService.getLastWeekDataForPieChart(lastweek,now)

        [count:count]
    }
}
