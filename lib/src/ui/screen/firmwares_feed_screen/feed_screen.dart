import 'package:flutter/material.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/ui/screen/firmwares_feed_screen/feed_card.dart';
import 'package:miyolla/src/ui/screen/firmwares_feed_screen/feed_navigation_drawer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firmwares'),
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      drawer: const FeedNavigationDrawer(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 6.0,
              horizontal: 12.0,
            ),
            child: Align(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 768),
                child: const FeedCard(),
              ),
            ),
          );
        },
      ),
    );
  }
}
