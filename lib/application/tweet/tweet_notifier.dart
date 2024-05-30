import 'dart:developer';
import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/domain/core/enum/tweet_type.dart';
import 'package:social_buzz/infrastructure/repo/tweet/model/tweetModel.dart';
import 'package:social_buzz/infrastructure/repo/tweet/tweetFacadeImpl.dart';
import 'package:social_buzz/infrastructure/third_party_service/appwrite_storage.dart';
import 'package:social_buzz/presentation/common/info_alert/snackBars.dart';
import 'package:social_buzz/presentation/screens/main/wrapper/pages_wrapper.dart';

final tweetNotifierProvider = StateNotifierProvider<TweetNotifier, bool>((ref) {
  final tweetFacadeImpl = ref.watch(tweetFacadeImplProvider);
  final storageApi = ref.watch(storageApiProvider);
  return TweetNotifier(
    ref: ref,
    tweetFacadeImpl: tweetFacadeImpl,
    storageApi: storageApi,
  );
});

final tweetDataProvider = FutureProvider((ref)async{
  final tweetControoler = await ref.watch(tweetNotifierProvider.notifier).getTweets();
  return tweetControoler;
});

final latestTweetProvider = StreamProvider.autoDispose((ref){
  final latestTweets = ref.watch(tweetNotifierProvider.notifier).getLatestTweets();
  return latestTweets; 
});




class TweetNotifier extends StateNotifier<bool> {
  final Ref _ref;
  final TweetFacadeImpl _tweetFacadeImpl;
  final StorageApi _storageApi;

  TweetNotifier({
    required Ref ref,
    required TweetFacadeImpl tweetFacadeImpl,
    required StorageApi storageApi,
  })  : _ref = ref,
        _tweetFacadeImpl = tweetFacadeImpl,
        _storageApi = storageApi,
        super(false);

  void shareTweet({
    required List<File> images,
    required String text,
  }) {
    if (images.isNotEmpty) {
      _shareImageTweet(
        images: images,
        text: text,
      );
    } else {
      _shareTextTweet(text: text);
    }
  }

  void _shareImageTweet({
    required List<File> images,
    required String text,
  }) async {
    
    final user = _ref.read(currentDetailsProvider).value;
    final imgLinks = await _storageApi.uploadImage(images);
    log('This is the image link ${imgLinks.first}');
    final TweetModel tweet = TweetModel(
      text: text,
      link: '',
      hashtags: [],
      imageLinks: imgLinks,
      uid: user!.uid,
      tweetedAt: DateTime.now().toString(),
      likes: [],
      tweetType: TweetType.image,
      commentIds: [],
      id: '',
      reshareCount: 0,
    );

    final storeTweet = await _tweetFacadeImpl.shareTweet(tweet);
    state = false;
    storeTweet.fold(
        (l) => SnackBars.failureSnackbar('Tweet', 'Could not upload tweet'),
        (tweet) {
      SnackBars.successSnackbar('Tweet', 'Tweet successfully passed');
    });
  }

  void _shareTextTweet({required String text}) async {
    final user = _ref.read(currentDetailsProvider).value;
    log('This is the user id ${user!.uid}');
    final TweetModel tweet = TweetModel(
      text: text,
      link: '',
      hashtags: [],
      imageLinks: [],
      uid: user.uid,
      tweetedAt: DateTime.now().toString(),
      likes: [],
      tweetType: TweetType.text,
      commentIds: [],
      id: '',
      reshareCount: 0,
    );

    final storeTweet = await _tweetFacadeImpl.shareTweet(tweet);
    state = false;
    storeTweet.fold(
        (l) => SnackBars.failureSnackbar('Tweet', 'Could not upload tweet'),
        (tweet) {
          Get.offAndToNamed(PagesWrapper.id);
      SnackBars.successSnackbar('Tweet', 'Tweet successfully passed');
    });
  }


  Future<List<TweetModel>> getTweets() async {
    final tweetList = await _tweetFacadeImpl.getTweet();
   final tweets= tweetList.map((tweet) => TweetModel.fromMap(tweet.data)).toList();
   log("$tweets");
   return tweets;
  }


  Stream<RealtimeMessage> getLatestTweets(){
    return _tweetFacadeImpl.getLatestTweet();
  }
}
