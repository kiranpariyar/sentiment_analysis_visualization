package grailswebapp

import grails.transaction.Transactional

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

    def getLastWeekDataForPieChart(Date start, Date end, String str) {

        def list = [1, 2, 3]
        def count = []
        def document

        // calculation of data for pie chart
        for (x in list) {
            document = TweetObject.where { sentimentRank == x && brandName == str && date > start && date < end }
            count << document.size()
        }
        return count
    }

    def getLastWeekDataForOtherChart(Date start,Date end,String str){

        def day = end - 7
        def map = [:]
        def list = [1, 2, 3]
        def countForDay
        def document
        double ratio
        def week = [1,2,3,4,5,6,7]

        // calculation of data for line graph
        for( d in week ){

            day += 1
            countForDay = []

            for( x in list){
//                document = TweetObject.findAllByDateBetweenAndSentimentRank(start,day,x,null)
//                countForDay << document.size()
                document = TweetObject.where { sentimentRank == x && brandName == str && date > start && date < day }
                countForDay << document.size()
            }

            if(countForDay.get(0) == 0){
                ratio = 0.0
                countForDay << ratio
            }else{
                ratio = (double)countForDay.get(2)/countForDay.get(0)
                countForDay << ratio.round(3)
            }
            map.put(d,countForDay)
            start += 1
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
        def dateDifference = end - start
        def map = [:]

        Date now = new Date()
        Date date1 = now - dateDifference
        date1.set(hourOfDay: 0, minute: 0, second: 0)
        def list = [1,2,3]
        def d
        def countForDay
        def i
        def document

        for(i=0;i<=dateDifference;i++){

            d = date1 + 1
            countForDay = []

            for( x in list){
                document = TweetObject.where { sentimentRank == x && brandName == str && date >= date1 && date < d }
                countForDay << document.size()

            }
            map.put(date1,countForDay)
            date1 += 1

        }
        return map
    }


    def getDataForComparision(Date startDate,Date endDate,String brandName){
        def dateDifference = endDate - startDate
        def map = [:]

        Date now = new Date()
        Date date1 = now - dateDifference
        date1.set(hourOfDay: 0, minute: 0, second: 0)
        println("seted date : " + date1)

        // converting date to calender
        /*Calendar calendar =  date1.toCalendar()
        calendar.set(Calendar.HOUR_OF_DAY,0)
        calendar.set(Calendar.MINUTE,0)
        calendar.set(Calendar.SECOND,0)
        println("calender date :" + calendar.getTime())
        */
        def list = [1,2,3]
        def d
        def countForDay
        def i
        def document

        for(i=0;i<=dateDifference;i++){

            d = date1 + 1
            countForDay = []

            for( x in list){
                document = TweetObject.where { sentimentRank == x && brandName == brandName && date >= date1 && date < d }
                countForDay << document.size()

            }
            def dateString = date1.format("yyyy-MM-dd").toString()
            println(dateString)
            map.put(dateString,countForDay)
            date1 += 1

        }

        return map
    }
}
