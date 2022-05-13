import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:webdesigndemo/login/login_screen_desktop.dart';
import 'package:webdesigndemo/login/login_screen_mobile.dart';
import 'package:webdesigndemo/login/login_screen_tablet.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: ScreenTypeLayout.builder(
          mobile: (context)=> const LoginScreenMobile(),
          tablet: (context)=> const LoginScreenTablet(),
          desktop:(context)=> const LoginScreenDesktop(),
        ),
      );

}
}