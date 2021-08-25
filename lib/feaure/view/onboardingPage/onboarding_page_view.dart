import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:travel_application/core/constants/app_constants.dart';
import 'package:travel_application/core/constants/text.constants.dart';
import 'package:travel_application/feaure/view/homePage/home_page_view.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appconstants = AppConstants();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: context.paddingMedium,
          child: Column(
            children: [
              Container(
                height: context.dynamicHeight(0.08),
                alignment: Alignment.center,
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText(
                      UITravelTextConstanst.title,
                      textStyle: context.textTheme.headline3!.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.indigo),
                    ),
                  ],
                  isRepeatingAnimation: true,
                ),
              ),
              buidText(context, appconstants),
              buildNavigationButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Container buildNavigationButton(BuildContext context) {
    return Container(
      height: context.dynamicHeight(0.08),
      width: context.dynamicWidth(0.4),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);
        },
        child: Text(UITravelTextConstanst.onboardingbutton),
        style: ElevatedButton.styleFrom(
            primary: Colors.indigo, textStyle: context.textTheme.headline5),
      ),
    );
  }

  Expanded buidText(BuildContext context, AppConstants appconstants) {
    return Expanded(
      child: Column(
        children: [
          Container(
            height: context.dynamicHeight(0.4),
            width: context.dynamicWidth(100),
            child: Image(
              image: AssetImage(appconstants.imageUrl),
            ),
          ),
          Text(
            UITravelTextConstanst.onboardingfirst,
            style: context.textTheme.headline4!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: context.dynamicHeight(0.05),
          ),
          Text(
            UITravelTextConstanst.onboardingsecond,
            style: context.textTheme.headline6!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
