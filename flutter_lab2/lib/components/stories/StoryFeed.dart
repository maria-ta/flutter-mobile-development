import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/stories/StoryRow.dart';
import 'package:flutter_lab2/models/mocks/Stories.mock.dart';
import 'package:provider/provider.dart';

class StoryFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: appStyleMode.text
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      color: appStyleMode.text,
                      size: 24.0,
                      semanticLabel: 'Go to direct messages',
                    ),
                    Text(
                      'Watch all',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: appStyleMode.text
                      ),
                    ),
                  ],
                )
              ],
            ),
            StoryRow(STORIES_MOCK),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    );
  }

}