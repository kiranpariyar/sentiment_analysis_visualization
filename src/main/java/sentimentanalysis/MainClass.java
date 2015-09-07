package sentimentanalysis;

import datamodel.Tweet;
import java.io.IOException;
import java.util.ArrayList;


/**
 * Created by kiran on 8/18/15.
 */

public class MainClass {

    TweetPreprocessing tweetPreproces = new TweetPreprocessing();
    SentimentAnalysis sentimentAnalysis = new SentimentAnalysis();


    public void diplayPreprocessedTweet(ArrayList<String> tweets){
        for (String tweet : tweets){
            System.out.println(tweet);
        }
    }

    public void diplaySentimentAnalysedTweet(ArrayList<Tweet> tweetObjectList){

        for(Tweet tweet : tweetObjectList){
            System.out.println(tweet.getTweet() + " : " + tweet.getSentimentRank());
        }
    }

    public ArrayList<Tweet> getSentiementTweets(ArrayList<Tweet> tweetObjectList) throws IOException {

        //for storing tweets and rank
        ArrayList<String> tweets = new ArrayList<>();
        ArrayList<Integer> tweetRank;

        int sizeOfTweet = tweetObjectList.size();

        for (Tweet aTweetList : tweetObjectList) {
            tweets.add(aTweetList.getTweet());
        }

        //Preprocessing the tweets
        System.out.print("\nPreprocessing the tweets :\n");
        tweets = tweetPreproces.getPreprocessedTweet(tweets);


//      sentiment analysis of tweets
        System.out.println("\nProcessing Sentiment Analysis of Tweets:");
        tweetRank = sentimentAnalysis.findSentiment(tweets);

        for(int i=0; i<sizeOfTweet; i++){
            tweetObjectList.get(i).setSentimentRank(tweetRank.get(i));
        }

//        mainObject.diplaySentimentAnalysedTweet(tweetObjectList);

//        for(Tweet tweet : tweetObjectList){
//            System.out.println(tweet.getTweet());
//        }

        return tweetObjectList;
    }
}
