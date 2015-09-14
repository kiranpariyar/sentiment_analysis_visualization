package grailswebapp

class DashboardController {

    TweetStatisticsService tweetStatisticsService

    def index() {
        redirect(action: "summary")
    }

    def summary(){

        def brandName = params.name
        def now
        def startDate
        def count
        def map
        def totalTweet
        double positivePercent
        double negativePercent
        double neutralPercent
        def tweets

        if(brandName == null) {
            def brandList = Brand.list()
            brandName = brandList.get(0).brandName
            session.brand = brandName
            println(brandName)

            now = new Date()
            startDate = now -7
            count = tweetStatisticsService.getLastWeekDataForPieChart(startDate ,now,brandName)
            map = tweetStatisticsService.getLastWeekDataForOtherChart(startDate ,now,brandName)
            totalTweet = count.sum()

            if(totalTweet == 0){
                render("data are not in database: total tweet = 0")
            }else {
                positivePercent = count.get(2) / totalTweet * 100
                negativePercent = count.get(0) / totalTweet * 100
                neutralPercent = count.get(1) / totalTweet * 100

                tweets = tweetStatisticsService.getTop5Tweets(startDate, now, brandName)

                [total: totalTweet, count: count, map: map, tweets: tweets, positive: positivePercent, negative: negativePercent, neutral: neutralPercent, brand: brandName, lastweek: startDate]
            }
        } else {
            def brand = Brand.findByBrandName(brandName)
            if ( brand != null ) {
                println("brandname from database :" + brand.brandName)
                session.brand = params.name

                now = new Date()
                startDate = now -7
                count = tweetStatisticsService.getLastWeekDataForPieChart(startDate, now, brand.brandName)
                map = tweetStatisticsService.getLastWeekDataForOtherChart(startDate, now, brand.brandName)
                totalTweet = count.sum()

                if(totalTweet == 0){
                    render("data are not in database")
                }else {

                    positivePercent = count.get(2) / totalTweet * 100
                    negativePercent = count.get(0) / totalTweet * 100
                    neutralPercent = count.get(1) / totalTweet * 100

                    tweets = tweetStatisticsService.getTop5Tweets(startDate, now,brand.brandName)

                    [total: totalTweet, count: count, map: map, tweets: tweets, positive: positivePercent, negative: negativePercent, neutral: neutralPercent, brand: session.brand, lastweek: startDate]
                }
            } else {
                println(params.name)
                render(view: "add")
            }
        }
    }
}
