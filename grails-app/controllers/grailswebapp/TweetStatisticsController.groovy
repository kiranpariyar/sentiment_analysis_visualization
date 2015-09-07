package grailswebapp

class TweetStatisticsController {

    def index() {
        redirect(action: showtweetstatics())
    }

    def list(){
//        def doc = TweetObject.list()
        def now = new Date()
        def lastWeek = now - 7
        def doc1 = TweetObject.findByDateBetween(lastWeek,now)

        def query = TweetObject.where{ sentimentRank == 1}
        def doc2 = query.list()

        def count2 = doc2.size()

        def doc3 = TweetObject.find{ sentimentRank == 1}
        [doc: doc1, doc2: doc2 , doc3:doc3, count2: count2]
    }

    def showtweet() {
//        def document = TweetObjectService.getLastWeekData()
        def now = new Date()
        def lastweek = now - 7

        def query = TweetObject.where { sentimentRank == 1 && date > lastweek && date < now}
        def document = query.list()
        def negativeCount = document.size()
        println negativeCount
//        def document = TweetObject.list()
        
        def doc = TweetObject.findAllByDateBetweenAndSentimentRank(lastweek,now,2,null)
        
        [document:document, negative: negativeCount,doc:doc]
    }

    def showtweetstatics(){
        def now = new Date()
        def lastweek = now - 7
        def list = [ 1, 2, 3]
        def count = []
        def document

        // calculation of data for pie chart
        for( x in list) {
            document = TweetObject.where { sentimentRank == x && date > lastweek && date < now }
            count << document.size()
            println count
        }

        def day = now - 7
        def map = [:]
        def countforday = []
        def doc

        // calculation of data for line graph
        def week = [1,2,3,4,5,6,7]
        for( d in week ){

            day += 1
            countforday = []

            for( x in list){
//                doc = TweetObject.where { sentimentRank == x && date > lastweek && date < day }
                doc = TweetObject.findAllByDateBetweenAndSentimentRank(lastweek,day,x,null)
                countforday << doc.size()

            }

            map.put(d,countforday)
            lastweek += 1
            println map

        }

        [count:count,map:map]
    }
}
