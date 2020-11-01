import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/utils/theme.dart';

class SongController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/next.svg',
          height: 25.0,
          width: 25.0,
        ),
        SizedBox(width: 35.0),
        Container(
          // padding: EdgeInsets.all(8.0),
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            color: HKColors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              'assets/icons/pause.svg',
              height: 24.0,
              width: 24.0,
              color: HKColors.black,
            ),
          ),
        ),
        SizedBox(width: 35.0),
        SvgPicture.asset(
          'assets/icons/back.svg',
          height: 25.0,
          width: 25.0,
        ),
      ],
    );
  }
}