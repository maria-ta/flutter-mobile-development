import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/animations/AnimatedPage.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'file:///D:/Study/Mobile/flutter-mobile-development/flutter_lab2/lib/components/routes/SubscriptionsFeed.dart';
import 'package:flutter_lab2/components/feed/Feed.dart';
import 'package:flutter_lab2/components/login/Login.dart';
import 'package:flutter_lab2/components/profile/Profile.dart';
import 'package:flutter_lab2/components/routes/SandboxNavigation.dart';
import 'package:flutter_lab2/components/shared/Footer.dart';
import 'package:flutter_lab2/components/shared/Header.dart';
import 'package:flutter_lab2/components/shared/ToBeImplemented.dart';
import 'package:flutter_lab2/constants/Gradient.dart';
import 'package:flutter_lab2/models/mocks/User.mock.dart';
import 'package:provider/provider.dart';

class MainTabsWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: appStyleMode.background,
        appBar: Header(),
        body: TabBarView(
          children: [
            SubscriptionsFeed(),
            Feed(),
            SandboxNavigation(),
            Profile(USER_MOCK, true),
          ],
        ),
        bottomNavigationBar: Footer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) {
            //     return CreatePostPage();
            //   }),
            // );
            Navigator.pushNamed(context, '/new-post');
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
              gradient: getStandartGradient(context),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}