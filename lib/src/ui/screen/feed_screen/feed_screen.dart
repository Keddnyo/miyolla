import 'package:flutter/material.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/ui/screen/feed_screen/feed_card.dart';
import 'package:miyolla/src/ui/screen/feed_screen/feed_navigation_drawer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        centerTitle: true,
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      drawer: const FeedNavigationDrawer(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Align(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 672),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: FeedCard(),
              ),
            ),
          );
        },
      ),
    );
  }
}
