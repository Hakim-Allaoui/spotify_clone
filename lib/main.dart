import 'package:flutter/material.dart';
import 'package:spotify_clone/pages/about_page.dart';
import 'package:spotify_clone/pages/export_page.dart';
import 'package:spotify_clone/pages/home_page.dart';
import 'package:spotify_clone/pages/player_page.dart';
import 'package:spotify_clone/pages/privacy_policy_page.dart';
import 'package:spotify_clone/pages/splash_screen.dart';

var routes = <String, WidgetBuilder>{
  "/home" : (BuildContext context) => HomePage(),
  "/player" : (BuildContext context) => PlayerPage(),
  "/export" : (BuildContext context) => ExportPage(),
  "/privacy" : (BuildContext context) => PrivacyPolicyPage(),
  "/about" : (BuildContext context) => AboutPage(),
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData(
        fontFamily: 'Proxima Nova',
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
      home: SplashScreen(),
    );
  }
}