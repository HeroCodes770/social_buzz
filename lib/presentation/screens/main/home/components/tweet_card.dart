import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/gen/assets.gen.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/infrastructure/repo/tweet/model/tweetModel.dart';
import 'package:social_buzz/presentation/common/info_alert/snackBars.dart';

class TweetCard extends HookConsumerWidget {
  final TweetModel tweetModel;
  const TweetCard({super.key, required this.tweetModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return ref.watch(userAccountDetailProvider(tweetModel.uid)).when(
        data: (data) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(data.profilePic),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    data.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ).paddingOnly(top: 5),
                  const Spacer(),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(timeago.format(
                      DateTime.parse(tweetModel.tweetedAt),
                      locale: 'en-short',
                    )),
                  )
                ],
              ),
              Text(
                tweetModel.text,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
              if (tweetModel.imageLinks.isNotEmpty) ...[
                Center(
                  child: Container(
                    height: 300,
                    width: size.width,
                    child: Image.network(
                      tweetModel.imageLinks[0],
                      fit: BoxFit.cover,
                      headers: {},
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: size.width,
                  color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TweetCardButtons(
                        tweetModel: tweetModel,
                        onTap: () {},
                        icon: Assets.icons.repost.image(
                          height: 25,
                          width: 25,
                        ),
                      ),
                      TweetCardButtons(
                        tweetModel: tweetModel,
                        onTap: () {},
                        icon: Assets.icons.chat.image(
                          height: 25,
                          width: 25,
                        ),
                      ),
                      TweetCardButtons(
                        tweetModel: tweetModel,
                        onTap: () {},
                        icon: Assets.icons.chat.image(
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ],
                  ),
                )
              ]
            ],
          ).marginAll(10);
        },
        error: (error, stk) {
          return SnackBars.successSnackbar('', '');
        },
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}

class TweetCardButtons extends StatelessWidget {
  const TweetCardButtons(
      {super.key,
      required this.tweetModel,
      required this.onTap,
      required this.icon});

  final TweetModel tweetModel;
  final Function() onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: onTap, icon: icon),
        Text(tweetModel.reshareCount.toString())
      ],
    );
  }
}
