import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotify_clone/utils/theme.dart';

class Tools {
  static double width = 0.0;
  static double height = 0.0;

  static getDimensions(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print('=============> width       : $width');
    print('=============> height      : $height');
  }

  static String durationToString(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes =
        twoDigits(duration.inMinutes.remainder(Duration.minutesPerHour));
    String twoDigitSeconds =
        twoDigits(duration.inSeconds.remainder(Duration.secondsPerMinute));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  static Future<Uint8List> selectPicture(BuildContext context) async {
    final picker = ImagePicker();
    Uint8List _image;

    final imageSource = await showModalBottomSheet<ImageSource>(
        context: context,
        backgroundColor: HKColors.green,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(15.0),
                topLeft: Radius.circular(15.0))),
        builder: (BuildContext ctx) {
          return Container(
            child: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 4.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          color: HKColors.white,
                          borderRadius: BorderRadius.circular(100.0)),
                    ),
                  ),
                ),
                ListTile(
                  title: new Text(
                    'Gallery',
                    textAlign: TextAlign.center,
                    style: HKTextStyles.kTitleTextStyle,
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                ),
                ListTile(
                  title: new Text(
                    'Camera',
                    textAlign: TextAlign.center,
                    style: HKTextStyles.kTitleTextStyle,
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          );
        });

    if (imageSource != null) {
      final file = await picker.getImage(source: imageSource);
      if (file != null) {
        _image = File(file.path).readAsBytesSync();
      }
    }
    return _image;
  }
}
