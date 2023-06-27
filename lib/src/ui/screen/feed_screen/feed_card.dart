import 'package:flutter/material.dart';

import '../../../common/constants.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: Styles().getRectangleBorder(context),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: const Text(
                'Xiaomi Smart Band 4',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('1.0.9.66'),
              leading: Image.asset('images/zepp.png'),
            ),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          const ListTile(
            title: Text(
              'Release notes:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('- Fix some known issues'),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.5,
            height: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(onPressed: () {}, child: const Text('More')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
