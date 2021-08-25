import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:travel_application/core/constants/color_theme.dart';
import 'package:travel_application/feaure/model/upcoming_grid_model.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({Key? key, required this.items}) : super(key: key);

  final List<UpcomingPhoto> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.25),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items.map<Widget>((photo) {
          return upcomingGridItem(context, photo);
        }).toList(),
      ),
    );
  }

  Card upcomingGridItem(BuildContext context, UpcomingPhoto photo) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Stack(
        children: [
          Image.network(
            photo.imageUrl ?? '',
            width: context.dynamicWidth(0.4),
            height: context.dynamicHeight(0.25),
            fit: BoxFit.cover,
          ),
          Padding(
            padding: context.horizontalPaddingMedium,
            child: Column(
              children: [
                Image.network(
                  photo.flagUrl ?? '',
                  width: context.dynamicWidth(0.1),
                  height: context.dynamicHeight(0.1),
                ),
                Text(
                  photo.upcomingString ?? '',
                  style: context.textTheme.headline6?.copyWith(
                      color: AppColor().white, fontWeight: FontWeight.w800),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
