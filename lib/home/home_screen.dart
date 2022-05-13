import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webdesigndemo/home/home_screen_desktop.dart';
import 'package:webdesigndemo/home/home_screen_mobile.dart';
import 'package:webdesigndemo/home/home_screen_tablet.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenTypeLayout.builder(
        mobile: (context)=> const HomeScreenMobile(),
        tablet: (context)=> const HomeScreenTablet(),
        desktop:(context)=> const HomeScreenDesktop(),
      ),
    );
  }
}
