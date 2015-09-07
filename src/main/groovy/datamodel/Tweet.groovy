package datamodel

/**
 * Created by kiran on 8/30/15.
 */
class Tweet {

    Date date
    String name
    String tweet
    int noOfFollower
    int retweet
    String brandName
    int sentimentRank
    String sentiment

    Date getDate() {
        return date
    }

    void setDate(Date date) {
        this.date = date
    }

    String getName() {
        return name
    }

    void setName(String name) {
        this.name = name
    }

    String getTweet() {
        return tweet
    }

    void setTweet(String tweet) {
        this.tweet = tweet
    }

    int getNoOfFollower() {
        return noOfFollower
    }

    void setNoOfFollower(int noOfFollower) {
        this.noOfFollower = noOfFollower
    }

    int getRetweet() {
        return retweet
    }

    void setRetweet(int retweet) {
        this.retweet = retweet
    }

    String getBrandName() {
        return brandName
    }

    void setBrandName(String brandName) {
        this.brandName = brandName
    }

    int getSentimentRank() {
        return sentimentRank
    }

    void setSentimentRank(int sentimentRank) {
        this.sentimentRank = sentimentRank
    }

    String getSentiment() {
        return sentiment
    }

    void setSentiment(String sentiment) {
        this.sentiment = sentiment
    }
}
