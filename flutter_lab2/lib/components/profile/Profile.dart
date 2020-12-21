import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/profile/ProfileHeader.dart';
import 'package:flutter_lab2/models/UserModel.dart';

class Profile extends StatelessWidget {
  UserModel user;
  bool isCurrent = false;
  Profile(UserModel user, bool isCurrent) {
    this.user = user;
    this.isCurrent = isCurrent;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
    child: Column(
      children: [
        ProfileHeader(user, isCurrent),

      ],
    )
    );
  }

}