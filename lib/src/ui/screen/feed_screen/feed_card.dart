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
          const ListTile(
            title: Tooltip(
              message: 'deviceSource: 24, productionSource: 256',
              child: Text(
                'Xiaomi Smart Band 4',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text('1.0.9.66'),
            // leading: Image.asset('images/zepp.png'),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.1,
            height: 0.5,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Fixed some known issues.'),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onBackground,
            thickness: 0.1,
            height: 0.5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Tooltip(
                  message: '4.36 Mb',
                  child: FilledButton(
                    onPressed: () {},
                    child: const Text('Download'),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
