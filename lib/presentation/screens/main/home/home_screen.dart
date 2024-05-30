import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/application/tweet/tweet_notifier.dart';
import 'package:social_buzz/domain/core/constants/appwrite_constants.dart';
import 'package:social_buzz/presentation/screens/main/home/components/tweet_card.dart';

class HomeScreen extends HookConsumerWidget {
  static const id = '/home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          actions: [
            IconButton(
              onPressed: () =>
                  ref.watch(authNotifierProvider.notifier).logOut(),
              icon: const Icon(Icons.logout),
            )
          ],
        ),
        body: ref.watch(tweetDataProvider).when(
              data: (tweetData) {
                return ref.watch(latestTweetProvider).when(
                    data: (data) {
                      if (data.events.contains(
                          'databases.*.${AppWriteConstants.databaseId}.collections.${AppWriteConstants.tweetsCollectionId}.documents.*.create')) {
                        return CustomScrollView(
                          slivers: [
                            SliverAnimatedList(
                              initialItemCount: tweetData.length,
                              itemBuilder: (context, index, animation) {
                                final singleTweetData = tweetData[index];
                                return TweetCard(tweetModel: singleTweetData);
                              },
                            )
                          ],
                        );
                      }
                    },
                    error: (error, stk) {},
                    loading: () {});
              },
              error: (error, stk) {},
              loading: () => const Center(child: CircularProgressIndicator()),
            ));
  }
}
