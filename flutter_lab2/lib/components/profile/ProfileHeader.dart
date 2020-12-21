import 'package:flutter/widgets.dart';
import 'package:flutter_lab2/components/shared/CircleAvatarFramed.dart';
import 'package:flutter_lab2/constants/Colors.dart';
import 'package:flutter_lab2/models/UserModel.dart';

class ProfileHeader extends StatelessWidget {
  bool isCurrent = false;
  UserModel user;
  ProfileHeader(UserModel user, bool isCurrent) {
    this.user = user;
    this.isCurrent = isCurrent;
  }

  Widget getLabelValue(String label, String value) {
    return Container(
      height: 200,
      child: Column(
        children: [
          Text(
              value,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                height: 30
              )
          ),
          Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 5,
                height: 20,
              )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatarFramed.custom(
          previewSrc: user.avatar,
          size: 30,
          delta: 2,
          isFramed: false,
        ),
        Row(
          children: [
            getLabelValue('Posts', '1'),
            getLabelValue('Readers', '1'),
            getLabelValue('Reading', '1'),
          ],
        )
      ],
    );
  }
  
}
