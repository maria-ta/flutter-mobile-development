import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/posts/PostsFeed.dart';
import 'package:flutter_lab2/components/stories/StoryFeed.dart';
import 'package:flutter_lab2/state/store/AppStore.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SubscriptionsFeed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   scrollDirection: Axis.vertical,
    //   children: [
    //     StoryFeed(),
    //     PostsFeed(POSTS_MOCK),
    //   ],
    // );
    return StoreConnector<AppStore, AppStore>(
      converter: (store) => store.state,
      builder: (context, appStore) {
        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            StoryFeed(),
            PostsFeed(appStore.posts),
          ],
        );
      },
    );
  }

}