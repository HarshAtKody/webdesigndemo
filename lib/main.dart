import 'package:flutter/material.dart';
import 'package:webdesigndemo/dashboard/dashboard_screen.dart';
import 'package:webdesigndemo/home/home_screen.dart';
import 'package:webdesigndemo/login/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: Theme.of(context).iconTheme.copyWith(color: Colors.black),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardScreen(title: 'Flutter Web Demo'),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
      // home: const DashboardScreen(title: 'Flutter Demo Web Page'),
    );
  }
}

