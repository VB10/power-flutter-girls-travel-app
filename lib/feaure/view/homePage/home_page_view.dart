import 'package:flutter/material.dart';
import 'package:travel_application/core/constants/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:travel_application/core/constants/image_constants.dart';
import 'package:travel_application/core/constants/text.constants.dart';
import 'package:travel_application/product/widgets/clipper_widget.dart';
import 'dart:math' as math;

import 'package:travel_application/product/widgets/upcoming_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle? get subtitleStyle => Theme.of(context)
      .textTheme
      .headline5
      ?.copyWith(fontWeight: FontWeight.w700, color: _color.textColor);
  AppColor _color = AppColor();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        children: [
          topBlueContainer(context),
          Padding(
            padding: context.horizontalPaddingNormal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                subtitleWithButton(),
                favoritesList(context),
                Text(UITravelTextConstanst.subtitle2, style: subtitleStyle),
                Upcoming(items: upcoming()),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Text(UITravelTextConstanst.subtitle3, style: subtitleStyle),
                ListView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 5,
                                    offset: Offset(1, 1),
                                    color: Colors.grey)
                              ]),
                          child: ListTile(
                              leading:
                                  Icon(Icons.car_rental, color: Colors.blue),
                              title: Text('Jannuary 14, Monday',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                              subtitle: Text('\$10',
                                  style: TextStyle(color: Colors.blue)),
                              trailing: Icon(
                                Icons.phone,
                                color: Colors.green,
                              )),
                        ),
                      );
                    })
              ],
            ),
          )
        ],
      )),
    );
  }

  SizedBox favoritesList(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.2),
      child: ListView.builder(
          itemCount: 4,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: context.horizontalPaddingNormal,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      'https://media.kommunity.com/avatar/059df322-7cda-4157-8e9e-47c4a83426b3_avatar_5f2cf9025e420.jpg',
                      height: context.height * 0.1,
                      width: context.dynamicWidth(0.2),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text('Beyza Karadeniz',
                      style: context.textTheme.subtitle1
                          ?.copyWith(color: _color.blue)),
                  Text('Developer',
                      style: context.textTheme.subtitle2
                          ?.copyWith(color: context.randomColor)),
                ],
              ),
            );
          }),
    );
  }

  ListTile subtitleWithButton() {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Text(UITravelTextConstanst.subtitle1, style: subtitleStyle),
      trailing: TextButton(
        onPressed: () {},
        child: Text(UITravelTextConstanst.seeAllButton),
      ),
    );
  }

  ClipPath topBlueContainer(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: context.paddingMedium,
        height: context.dynamicHeight(0.3),
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor().containerBlue,
          AppColor().containerLightBlue,
        ])),
        child: Column(children: [
          customAppBar(context),
          textField(context),
        ]),
      ),
    );
  }

  Padding textField(BuildContext context) {
    return Padding(
      padding: context.verticalPaddingMedium,
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ).copyWith(
          hintText: 'Search places',
          prefixIcon: Icon(
            Icons.search,
            color: _color.grey,
          ),
        ),
      ),
    );
  }

  Row customAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.menu, color: _color.white),
        Text(
          UITravelTextConstanst.homePageTitle,
          style: context.textTheme.headline5
              ?.copyWith(color: _color.white, fontWeight: FontWeight.w700),
        ),
        SizedBox()
      ],
    );
  }
}
