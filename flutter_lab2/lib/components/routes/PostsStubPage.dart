import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/colors/AppStyleModeNotifier.dart';
import 'package:flutter_lab2/components/posts/PostsStub.dart';
import 'package:provider/provider.dart';

class PostsStubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appStyleMode = Provider.of<AppStyleModeNotifier>(context);
    return Scaffold(
      backgroundColor: appStyleMode.background,
      body: PostsStub(),
    );
  }
}