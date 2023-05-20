import 'package:flutter/material.dart';
import 'package:miyolla/src/app/utils/extensions/system_overlay_extensions.dart';
import 'package:miyolla/src/ui/screen/feed_screen/feed_navigation_drawer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var background = Theme.of(context).colorScheme.background;

    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        shadowColor: Colors.black,
        systemOverlayStyle: context.colorizeBars,
      ),
      drawer: const FeedNavigationDrawer(),
    );
  }
}
