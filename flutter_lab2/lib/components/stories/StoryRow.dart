import 'package:flutter/cupertino.dart';
import 'package:flutter_lab2/components/stories/StoryItem.dart';
import 'package:flutter_lab2/models/StoryModel.dart';

class StoryRow extends StatelessWidget {
  List<StoryModel> stories;

  StoryRow(this.stories);

  List<StoryItem> getStoryItems() {
    return stories.map((StoryModel storyData) =>
        StoryItem(storyData.previewSrc, storyData.username)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxHeight: 110,
        minHeight: 110
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: getStoryItems(),
      )
    );
  }}