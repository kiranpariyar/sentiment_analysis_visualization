package grailswebapp

import grails.transaction.Transactional

import java.util.Date
import java.text.SimpleDateFormat

@Transactional
class TweetStatisticsService {

    def getTop5Tweets(Date start,Date end,String str){

        def tweets = [:]
        def list = [1, 2, 3]
        def document
        def doc

        for (x in list) {
            document = TweetObject.where { sentimentRank == x && brandName == str && date > start && date < end }
            doc = document.list(max: 5,sort: "noOfFollower",order: "desc")
            tweets.put(x,doc.tweet)
        }

        return tweets
    }

    def getLastWeekDataForPieChart(Date start, Date end,String str) {

        def list = [1, 2, 3]
        def count = []
        def document

        // calculation of data for pie chart
        for (x in list) {
            document = TweetObject.where { sentimentRank == x && brandName == str && date > start && date < end }
            count << document.size()

//            println count
        }
        println "returning value of count"

        return count
    }

    def getLastWeekDataForOtherChart(Date start,Date end,String str){

        def day = end - 7
        def map = [:]
        def list = [1, 2, 3]
        def countforday
        def document

        // calculation of data for line graph
        def week = [1,2,3,4,5,6,7]

        for( d in week ){

            day += 1
            countforday = []

            for( x in list){
//                document = TweetObject.findAllByDateBetweenAndSentimentRank(start,day,x,null)
//                countforday << document.size()
                document = TweetObject.where { sentimentRank == x && brandName == str && date > start && date < day }
                countforday << document.size()

            }

            map.put(d,countforday)
            start += 1
//            println map
        }
        return map
    }

    def getDataFromStartToEndDateForPieChart(String startDate,String endDate,String str){
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
        Date start = formatter.parse(startDate)
        Date end = formatter.parse(endDate)
        def count = getLastWeekDataForPieChart(start,end,str)
        return count
    }

    def getDataFromStartToEndDateForOtherChart(String startDate,String endDate,String str){

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
        Date start = formatter.parse(startDate)
        Date end = formatter.parse(endDate)
        def dateDefference = end - start
        def map = [:]

        Date now = new Date()
        Date date1 = now - dateDefference
        date1.setHours(0)
        date1.setMinutes(0)
        date1.setSeconds(0)
        println(now)
        println("start date")
        println(date1)
        def list = [1,2,3]
        def d
        def countforday
        def i
        def document

        for(i=0;i<=dateDefference;i++){

            d = date1 + 1
            countforday = []

            for( x in list){
                document = TweetObject.where { sentimentRank == x && brandName == str && date >= date1 && date < d }
                countforday << document.size()

            }
            map.put(date1,countforday)
            date1 += 1

        }

        println("enddate")
        println(map)

        return map
    }
}
