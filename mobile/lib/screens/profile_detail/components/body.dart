import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/profile/components/profile_pic.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(40)),
          ProfilePic(),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
