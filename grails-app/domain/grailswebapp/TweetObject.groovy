package grailswebapp

import org.bson.types.ObjectId

class TweetObject {

    static mapWith = "mongo"
    ObjectId id
    Date date
    String name
    String tweet
    int noOfFollower
    int retweet
    String brandName
    int sentimentRank
    String sentiment

    static constraints = {
        name(blank: false)
        tweet(blank: false)
        noOfFollower(blank: true)
        retweet(blank: true)
        sentimentRank(blank: false)
        brandName(blank: false)
    }
}
