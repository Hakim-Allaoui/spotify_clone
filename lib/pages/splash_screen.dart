import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/navigator.dart';
import 'package:spotify_clone/utils/tools.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      HKNavigator.goHome(context);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Tools.getDimensions(context);
    return Container(
      child: Center(
        child: Image.asset("assets/images/spotify_logo_title.png"),
      ),
    );
  }
}