import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/gen/assets.gen.dart';
import 'package:social_buzz/presentation/screens/main/home/components/create_a_tweet_screen.dart';
import 'package:social_buzz/presentation/screens/main/home/home_screen.dart';

class PagesWrapper extends HookConsumerWidget {
  static const id = '/wrapper';
  const PagesWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = useState(0);

    final pages = [
      const HomeScreen(),
      const Scaffold(),
      const Scaffold(body: Center(child: Text('Notifcation'))),
    ];
    return Scaffold(
      body: Stack(
        children: pages
            .asMap()
            .map((key, page) => MapEntry(
                key,
                Offstage(
                  offstage: currentIndex.value != key,
                  child: page,
                )))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) => currentIndex.value = index,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.home.image(height: 25, width: 25),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Assets.icons.search.image(height: 25, width: 25),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Assets.icons.notification.image(height: 25, width: 25),
              label: 'Notifications')
        ],
      ),
      floatingActionButton: FloatingActionButton(
          shape: const RoundedRectangleBorder(),
          onPressed: () => Get.toNamed(CreateNewTweet.id)),
    );
  }
}
