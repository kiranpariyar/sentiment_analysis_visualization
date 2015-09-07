package grailswebapp

class DashboardController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        redirect(action: "summary")
    }

    def summary(){

        println(params.name)

        if(params.name == null) {
            session.brandSession = "samsung"
        } else {
            session.brandSession = params.name
        }

        println(session.brandSession)

        def now = new Date()
        def lastweek = now -7
        def count = tweetStatisticsService.getLastWeekDataForPieChart(lastweek,now,session.brandSession)
        def map = tweetStatisticsService.getLastWeekDataForOtherChart(lastweek,now,session.brandSession)
        def totaltweet = count.sum()
        def positivepercent = Math.round(100*count.get(2)/totaltweet)
        def negativepercent = Math.round(100*count.get(0)/totaltweet)
        def neutralpercent = Math.round(100*count.get(1)/totaltweet)

        def tweets = tweetStatisticsService.getTop5Tweets(lastweek,now,session.brandSession)

        [total: totaltweet, count:count,map:map,tweets:tweets,positive:positivepercent, negative:negativepercent, neutral:neutralpercent,brand:session.brandSession,lastweek:lastweek]
    }

}
