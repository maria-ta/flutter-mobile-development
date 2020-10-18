import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/CreatePostPage.dart';
import 'file:///D:/Study/Mobile/flutter_lab2/lib/components/shared/Footer.dart';
import 'file:///D:/Study/Mobile/flutter_lab2/lib/components/shared/Header.dart';
import 'package:flutter_lab2/components/SubscriptionsFeed.dart';
import 'package:flutter_lab2/components/feed/Feed.dart';
import 'package:flutter_lab2/components/posts/CreatePost.dart';
import 'package:flutter_lab2/components/shared/ToBeImplemented.dart';
import 'package:flutter_lab2/constants/Gradient.dart';

class PageTabWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: Header(),
        body: TabBarView(
          children: [
            SubscriptionsFeed(),
            Feed(),
            // ToBeImplemented(),
            CreatePost(),
            ToBeImplemented(),
          ],
        ),
        bottomNavigationBar: Footer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return CreatePostPage();
              }),
            );
          },
          child: Container(
            width: 60,
            height: 60,
            child: Icon(
              Icons.camera_alt,
              size: 30,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: standartGradient,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}