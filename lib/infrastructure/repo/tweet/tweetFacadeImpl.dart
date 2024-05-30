import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';
import 'package:social_buzz/domain/core/dependency_injection.dart';
import 'package:social_buzz/domain/repo/tweet/tweet_repo.dart';
import 'package:social_buzz/infrastructure/repo/tweet/model/tweetModel.dart';

final tweetFacadeImplProvider = Provider(
  (ref) {
    TweetFacadeImpl(
      db: ref.watch(databaseProvider),
      realTime: ref.watch(realTimeProvider),
    );
  },
);

class TweetFacadeImpl implements TweetFacade {
  final Databases _db;
  final Realtime _realTime;

  TweetFacadeImpl({required Databases db, required Realtime realTime})
      : _db = db,
        _realTime = realTime;
  @override
  Future<Either<String, Document>> shareTweet(TweetModel tweet) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.tweetsCollectionId,
        documentId: ID.unique(),
        data: tweet.toMap(),
      );
      return right(document);
    } on AppwriteException catch (e) {
      log(e.message!);
      rethrow;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  @override
  Future<List<Document>> getTweet() async {
    try {
      final documents = await _db.listDocuments(
        databaseId: AppWriteConstants.databaseId,
        collectionId: AppWriteConstants.tweetsCollectionId,
      );
      return documents.documents;
    } on AppwriteException catch (e) {
      log(e.message!);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
    return [];
  }

  @override
  Stream<RealtimeMessage> getLatestTweet()  {
    final streams = _realTime.subscribe([
      'databases.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.tweetsCollectionId}.documents'
    ]).stream;
      log('$streams');
    return streams;
  }
  
}
