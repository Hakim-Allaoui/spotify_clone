import 'package:flutter/material.dart';

class HKNavigator {
  static goHome(BuildContext context){
    Navigator.pushReplacementNamed(context, '/home');
  }

  static goPlayer(BuildContext context){
    Navigator.pushNamed(context, '/player');
  }


  static goExport(BuildContext context){
    Navigator.pushNamed(context, '/export');
  }

  static goPrivacy(BuildContext context){
    Navigator.pushNamed(context, '/privacy');
  }

  static goAbout(BuildContext context){
    Navigator.pushNamed(context, '/about');
  }
}