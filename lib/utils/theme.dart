import 'package:flutter/material.dart';

class HKColors {
  static const bg = Color(0xff30314F);
  static const green = Color(0xff1DB954);
  static const white = Color(0xFFFAFAFA);
  static const black = Color(0xff191414);
  static const grey = Color(0xFFAEAEAE);
}

class HKTextStyles {
  static final kCaptionTextStyle = TextStyle(
    color: HKColors.white,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final kBodyTextStyle = TextStyle(
    color: HKColors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
  );

  static final timeTextStyle = TextStyle(
    color: HKColors.grey,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static final kTitleTextStyle = TextStyle(
    color: HKColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static final kSubTitleTextStyle = TextStyle(
    color: HKColors.grey,
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );
}
