import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/profile/components/body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Profile"),
      //   backgroundColor: kPrimaryColor,
      //   automaticallyImplyLeading: false,
      //   // actions: [
      //   //   IconBtnWithCounter(
      //   //     svgSrc: "assets/icons/login.svg",
      //   //     press: () {},
      //   //     // press: () => Navigator.pushNamed(context, CartScreen.routeName),
      //   //   ),
      //   // ],
      // ),
      body: Body(),
    );
  }
}
