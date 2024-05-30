import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/application/auth/auth_notifier.dart';
import 'package:social_buzz/application/tweet/tweet_notifier.dart';
import 'package:social_buzz/domain/core/helpers/image_picker.dart';
import 'package:social_buzz/gen/assets.gen.dart';
import 'package:social_buzz/presentation/widgets/image_render.dart';
import 'package:social_buzz/presentation/widgets/tweet_button.dart';

class CreateNewTweet extends HookConsumerWidget {
  static const id = '/create_tweet';
  const CreateNewTweet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tweetTextController = useTextEditingController();

    final currentUser = ref.watch(currentDetailsProvider).value;

    final imagesToUpload = useState(<File>[]);

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: InkWell(
            onTap: () => Get.back(),
            child: const Icon(Icons.close),
          ),
          actions: [
            TweetButton(
              onTap: () {
                ref.watch(tweetNotifierProvider.notifier).shareTweet(
                      images: imagesToUpload.value,
                      text: tweetTextController.text,
                    );
              },
            ).marginOnly(right: 20)
          ],
        ),
        body: currentUser != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(currentUser.profilePic),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: tweetTextController,
                            decoration: const InputDecoration(
                                hintText: 'Whazzz happening?'),
                            maxLines: null,
                            maxLength: 1000,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    if (imagesToUpload.value.isNotEmpty) ...[
                      ImageRender(
                        length: imagesToUpload.value.length,
                        images: imagesToUpload.value,
                      )
                    ]
                  ],
                ),
              )
            : const Center(
                child: Text('Oops something went wrong'),
              ),
        bottomNavigationBar: Row(children: [
          InkWell(
            onTap: () async {
              final images =
                  await ref.watch(imagePickerProvider).getMultipleImages();
              imagesToUpload.value = images;
             
            },
            child: Assets.icons.gallery.image(height: 35, width: 35),
          ),
          const SizedBox(width: 20),
          InkWell(
            onTap: () {},
            child: Assets.icons.gif.image(height: 35, width: 35),
          ),
        ]).paddingAll(25));
  }
}
