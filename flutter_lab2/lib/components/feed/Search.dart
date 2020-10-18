import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// TODO: make Search StateFul, add Search to Feed
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black12,
              size: 24.0,
              semanticLabel: 'Search',
            ),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
    // return Form(
    //   child: Row(
    //     children: [
    //       Container(
    //         width: 300,
    //         child: TextFormField(
    //           decoration: const InputDecoration(
    //             hintText: 'Search...',
    //           ),
    //         ),
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.search,
    //           color: Colors.black12,
    //           size: 24.0,
    //           semanticLabel: 'Search',
    //         ),
    //         color: Colors.white,
    //         onPressed: () {},
    //       ),
    //     ],
    //   )
    // );
  }

}