import 'package:flutter/material.dart';
import 'package:travel_application/feaure/view/onboardingPage/onboarding_page_view.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OnboardingPage(),
    );
  }
}