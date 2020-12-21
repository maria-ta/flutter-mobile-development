import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab2/components/posts/CreatePost.dart';
import 'package:flutter_lab2/components/shared/Header.dart';

class CreatePostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      body: CreatePost(),
    );
  }
}