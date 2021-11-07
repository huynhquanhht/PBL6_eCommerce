import 'package:flutter/material.dart';
import 'package:online_shop_app/screens/home/components/sort_product_field.dart';

import '../../../size_config.dart';
// import 'categories.dart';
import 'home_header.dart';
// import 'popular_product.dart';
// import 'special_offers.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),

            SizedBox(height: getProportionateScreenWidth(10)),
            SortProductField(),
            // DropDown(),
            // DiscountBanner(),
            // Categories(),
            // SpecialOffers(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // LastestProducts(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            // PopularProducts(),
          ],
        ),
      ),
    );
  }
}
