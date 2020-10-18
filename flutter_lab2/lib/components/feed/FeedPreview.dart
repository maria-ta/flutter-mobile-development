import 'package:flutter/cupertino.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:flutter_lab2/helpers/getRandomColor.dart';
import 'package:flutter_lab2/models/PostModel.dart';

class FeedPreview extends StatelessWidget {
  PostModel post;

  FeedPreview(this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getRandomColor(),
      child: Image.network(
        post.imageSrcs[0],
        fit: BoxFit.cover,
      ),
    );
  }


}