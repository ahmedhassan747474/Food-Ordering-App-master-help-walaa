import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_app/constants.dart';
import 'package:food_app/model/resturnte.dart';
import 'package:food_app/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Restaurants restaurants;
  DetailsScreen(this.restaurants);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/share.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/more.svg"),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(restaurants),
    );
  }
}
