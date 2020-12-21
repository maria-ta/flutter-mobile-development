import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/animations/AnimatedRoute.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/routes/CreatePostPage.dart';
import 'package:flutter_lab2/components/routes/LoginPage.dart';
import 'package:flutter_lab2/components/routes/MainTabsWrapper.dart';
import 'package:flutter_lab2/components/routes/PostPage.dart';
import 'package:flutter_lab2/components/routes/PostsStubPage.dart';
import 'package:flutter_lab2/components/routes/RegistrationPage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    _updateColorTheme(appStyleMode);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // backgroundColor: appStyleMode.background,
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainTabsWrapper(),
        '/new-post': (context) => CreatePostPage(),
        '/post': (context) => PostPage(),
        '/login': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/animations': (context) => AnimatedRoute(),
        '/posts-placeholder': (context) => PostsStubPage(),
      },
    );
  }

  Future<bool> _getColorThemeFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool darkMode = prefs.getBool('darkMode');
    return darkMode;
  }

  void _updateColorTheme(AppStyleModeNotifier appStyleMode) {
    _getColorThemeFromPrefs().then((darkMode) {
      appStyleMode.switchMode(darkMode);
    });
  }
}