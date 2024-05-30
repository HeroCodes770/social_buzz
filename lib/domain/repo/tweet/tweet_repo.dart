

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:social_buzz/infrastructure/repo/tweet/model/tweetModel.dart';

abstract class TweetFacade{
  Future<Either<String, Document>> shareTweet(TweetModel tweet);

 Future< List<Document>> getTweet();

 Stream<RealtimeMessage> getLatestTweet();
}