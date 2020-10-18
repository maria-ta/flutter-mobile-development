import 'package:flutter/widgets.dart';

class PostBody extends StatelessWidget {
  List<String> imageSrcs;

  PostBody(this.imageSrcs);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(imageSrcs[0]),
    );
  }
}