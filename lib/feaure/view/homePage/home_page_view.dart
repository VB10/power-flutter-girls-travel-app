import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:travel_application/core/constants/app_constants.dart';
import 'package:travel_application/core/constants/color_theme.dart';
import 'package:kartal/kartal.dart';
import 'package:travel_application/core/constants/image_constants.dart';
import 'package:travel_application/core/constants/text.constants.dart';
import 'package:travel_application/feaure/model/upcoming_grid_model.dart';
import 'package:travel_application/feaure/service/travel_page_service.dart';
import 'package:travel_application/feaure/viewModel/travel_view_model.dart';
import 'package:travel_application/product/widgets/clipper_widget.dart';
import 'dart:math' as math;

import 'package:travel_application/product/widgets/upcoming_card_widget.dart';
import 'package:vexana/vexana.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TravelViewModel viewModel;

  @override
  void initState() {
    super.initState();
    final manager =
        NetworkManager(options: BaseOptions(baseUrl: AppConstants.baseURl));
    viewModel = TravelViewModel(TravelPageService(manager));
    viewModel.fetcTravelItem();
  }

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
                Observer(builder: (_) {
                  return viewModel.isLoading
                      ? LinearProgressIndicator()
                      : Upcoming(
                          items: viewModel.travelItems
                              .map((e) => UpcomingPhoto(
                                  imageUrl: e.upcomingBackground,
                                  flagUrl: e.upcomingFlag,
                                  upcomingString: e.upcomingPlace))
                              .toList());
                }),
                SizedBox(
                  height: context.height * 0.02,
                ),
                Text(UITravelTextConstanst.subtitle3, style: subtitleStyle),
                Observer(builder: (_) {
                  return viewModel.isLoading
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: viewModel.travelItems.length,
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
                                    leading: Icon(Icons.car_rental,
                                        color: Colors.blue),
                                    title: Text(
                                        viewModel.travelItems[index].rentDay
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold)),
                                    subtitle: Text(
                                        viewModel.travelItems[index].rentPrice
                                            .toString(),
                                        style: TextStyle(color: Colors.blue)),
                                    trailing: Icon(
                                      Icons.phone,
                                      color: Colors.green,
                                    )),
                              ),
                            );
                          });
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
      child: Observer(builder: (_) {
        return viewModel.isLoading
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: viewModel.travelItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: context.horizontalPaddingNormal,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            viewModel.travelItems[index].photo.toString(),
                            height: context.height * 0.1,
                            width: context.dynamicWidth(0.2),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(viewModel.travelItems[index].name.toString(),
                            style: context.textTheme.subtitle1
                                ?.copyWith(color: _color.blue)),
                        Text(viewModel.travelItems[index].job.toString(),
                            style: context.textTheme.subtitle2
                                ?.copyWith(color: context.randomColor)),
                      ],
                    ),
                  );
                });
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
