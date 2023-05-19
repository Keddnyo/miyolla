import 'package:flutter/material.dart';
import 'package:miyolla/src/ui/screen/feed_screen/feed_navigation_drawer.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
        shadowColor: Colors.black,
      ),
      drawer: const FeedNavigationDrawer(),
    );
  }
}
