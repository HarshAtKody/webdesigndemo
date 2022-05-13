import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webdesigndemo/dashboard/dashboard_desktop_screen.dart';
import 'package:webdesigndemo/dashboard/dashboard_mobile_screen.dart';
import 'package:webdesigndemo/dashboard/dashboard_tablet_screen.dart';


  class DashboardScreen extends StatefulWidget {
    const DashboardScreen({Key? key, required this.title}) : super(key: key);
    final String title;

    @override
    State<DashboardScreen> createState() => _DashboardScreenState();
  }

  class _DashboardScreenState extends State<DashboardScreen> {
    @override
    Widget build(BuildContext context) {

      return Scaffold(
        backgroundColor: const Color(0xffE8F9FD),
        body: ScreenTypeLayout.builder(
          mobile: (context)=> const DashboardMobileScreen(),
          tablet: (context)=> const DashboardTabletScreen(),
          desktop:(context)=> const DashboardDesktopScreen(),
        ),
      );
    }

  }