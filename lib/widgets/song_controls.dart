import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/widgets/clickable_text.dart';

class SongDetailControls extends StatefulWidget {
  @override
  _SongDetailControlsState createState() => _SongDetailControlsState();
}

class _SongDetailControlsState extends State<SongDetailControls> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClickableText(
                        title: 'Title',
                        text: 'Dyabala',
                        textStyle: HKTextStyles.kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      ClickableText(
                        title: 'Artist',
                        text: 'Abdelgeelgha4',
                        textStyle: HKTextStyles.kSubTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/heart.svg',
                  // color: HKColors.white,
                  height: 18.0,
                  width: 18.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          spSlider(),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/shuffle.svg',
                      color: HKColors.green,
                      height: 18.0,
                      width: 18.0,
                    ),
                    SvgPicture.asset(
                      'assets/icons/dot.svg',
                      height: 4.0,
                      width: 4.0,
                    ),
                  ],
                ),
                Expanded(
                  child: songController(),
                ),
                Column(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/repeat.svg',
                      color: HKColors.white,
                      height: 18.0,
                      width: 18.0,
                    ),
                    SvgPicture.asset(
                      'assets/icons/dot.svg',
                      height: 0.0,
                      width: 4.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/devices.svg',
                  height: 18.0,
                  width: 18.0,
                ),
                SvgPicture.asset(
                  'assets/icons/playlist.svg',
                  height: 18.0,
                  width: 18.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget songController() {
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

  Widget spSlider() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 3.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 15.0),
            ),
            child: Slider(
              min: 0,
              max: 100,
              inactiveColor: HKColors.white.withOpacity(0.1),
              activeColor: HKColors.white,
              divisions: 100,
              onChanged: (double value) {},
              value: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '01:02',
                style: HKTextStyles.timeTextStyle,
              ),
              Text(
                '03:26',
                style: HKTextStyles.timeTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}