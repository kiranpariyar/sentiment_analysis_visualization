package grailswebapp

import datamodel.BrandData
import datamodel.Tweet
import sentimentanalysis.MainClass
import tweetfromtwitter.RetrieveTwitterTweet

class SentimentAnalysisController {

//    def tweetObject = new TweetObject()

    def index() {
        redirect(action: "retrieveTweets")
    }

    def save() {
        def tweet = new TweetObject(date: "2015-08-29T18:15:00Z",name: "kiran", tweet: "i love samsung",noOfFollower: 5,retweet: 20,brandName: "samsung",sentiment: "positive",sentimentRank: 3)
        println(tweet.save())

        def tweet1 = new TweetObject()
        tweet1.date =  new Date()
        tweet1.name =  "kiran"
        tweet1.tweet = "i love apple"
        tweet1.noOfFollower = 5
        tweet1.retweet = 20
        tweet1.brandName = "apple"
        tweet1.sentimentRank = 3
        tweet1.sentiment = "positive"
        tweet1.save()

        def user = new User(firstName: "kiran",lastName: "pariyar",password: "password",username: "kiran pariyar")
        println(user.save())

        render "data successfully saved"
    }

    def retrieveTweets(){

        def brand = Brand.list()
        def brandList = new ArrayList<BrandData>()

        for(b in brand){
            def bd = new BrandData(brandName: b.brandName,searchTerm: b.searchTerm)
            brandList.add(bd)
        }

        def tweetObjectList = RetrieveTwitterTweet.getBrandTweets(brandList)

        [tweets : tweetObjectList]

    }

    def sentiment(){

        def brand = Brand.list()

        def brandList = new ArrayList<BrandData>()

        for(b in brand){
            def bd = new BrandData(brandName: b.brandName,searchTerm: b.searchTerm)
            brandList.add(bd)
        }

        def tweetObjectList = new Tweet()
        tweetObjectList = RetrieveTwitterTweet.getBrandTweets(brandList)

        def mainClass = new MainClass()
        def afterSentimentAnalysis = mainClass.getSentiementTweets(tweetObjectList)

        def analysedTweet = afterSentimentAnalysis.get(1)

        def tweet = new TweetObject()
        tweet['date'] = analysedTweet.getDate()
        tweet['name'] = analysedTweet.getName()
        tweet['tweet'] = analysedTweet.getTweet()
        tweet['sentimentRank'] = analysedTweet.getSentimentRank()
        tweet.save()
        println(tweet.save())
//        def tweet1 = new TweetObject()
//        tweet1.date =  afterSentimentAnalysis.get(1).date
//        tweet1.name =  afterSentimentAnalysis.get(1).name
//        tweet1.tweet = afterSentimentAnalysis.get(1).tweet
//        tweet1.noOfFollower = afterSentimentAnalysis.get(1).noOfFollower
//        tweet1.retweet = afterSentimentAnalysis.get(1).retweet
//        tweet1.brandName = afterSentimentAnalysis.get(1).brandName
//        tweet1.sentimentRank = afterSentimentAnalysis.get(1).sentimentRank
//        tweet1.sentiment = afterSentimentAnalysis.get(1).sentiment
//        tweet1.save()


//        for(analysedTweet in afterSentimentAnalysis){
//            tweet.date = analysedTweet.date
//            tweet.name = analysedTweet.name
//            tweet.tweet = analysedTweet.tweet
//            tweet.noOfFollower = analysedTweet.noOfFollower
//            tweet.retweet = analysedTweet.retweet
//            tweet.brandName = analysedTweet.brandName
//            tweet.sentimentRank = analysedTweet.sentimentRank
//            tweet.sentiment = analysedTweet.sentiment
//            tweet.save()
//        }

//        def tweet = new TweetObject(date: afterSentimentAnalysis.get(1).date, name: afterSentimentAnalysis.get(1).name, tweet: afterSentimentAnalysis.get(1).tweet, noOfFollower: afterSentimentAnalysis.get(1).noOfFollower, retweet: afterSentimentAnalysis.get(1).retweet, brandName: afterSentimentAnalysis.get(1).brandName, sentimentRank: afterSentimentAnalysis.get(1).sentimentRank, sentiment: afterSentimentAnalysis.get(1).sentiment)
//        println(afterSentimentAnalysis.get(1).date)
//        println(afterSentimentAnalysis.get(1).name)
//        println(afterSentimentAnalysis.get(1).tweet)
//        println(afterSentimentAnalysis.get(1).noOfFollower)
//        println(afterSentimentAnalysis.get(1).retweet)
//        println(afterSentimentAnalysis.get(1).brandName)
//        println(afterSentimentAnalysis.get(1).sentimentRank)
//        println(afterSentimentAnalysis.get(1).sentiment)

        /*println(tweet.date)
        println(tweet.name)
        println(tweet.tweet)
        println(tweet.noOfFollower)
        println(tweet.retweet)
        println(tweet.brandName)
        println(tweet.sentimentRank)
        println(tweet.sentiment)
        tweet.save()*/

//        def analysedTweet = afterSentimentAnalysis.get(1)

/*        tweetObject.date = analysedTweet.date
        tweetObject.name = analysedTweet.name
        tweetObject.tweet = analysedTweet.tweet
        tweetObject.noOfFollower = analysedTweet.noOfFollower
        tweetObject.retweet = analysedTweet.retweet
        tweetObject.brandName = analysedTweet.brandName
        tweetObject.sentimentRank = analysedTweet.sentimentRank
        tweetObject.sentiment = analysedTweet.sentiment
        println(tweetObject.tweet)
        println(tweetObject.save())
//        println(tweetObject.save)
//        tweetObject.save flush:true
*/


        [afterSentimentAnalysis : afterSentimentAnalysis]
    }

    def ajaxtest(){
        def testString = "Hello Ajax"
        render testString
    }
}
