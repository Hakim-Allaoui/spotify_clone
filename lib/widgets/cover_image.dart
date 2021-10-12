import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spotify_clone/utils/ads_helper.dart';
import 'package:spotify_clone/utils/tools.dart';

class SongDetailCoverImage extends StatefulWidget {
  @override
  _SongDetailCoverImageState createState() => _SongDetailCoverImageState();
}

class _SongDetailCoverImageState extends State<SongDetailCoverImage> {
  Uint8List picture;
  AdsHelper ads;

  @override
  void initState() {
    super.initState();
    ads = new AdsHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: getCoverImage(),
      ),
    );
  }

  Widget getCoverImage() {
    return GestureDetector(
      onTap: () async {
        picture = await Tools.selectPicture(context) ??
            picture ??
            (await rootBundle.load('assets/images/cover.png'))
                .buffer
                .asUint8List();
        setState(() {});
        ads.showAdmobInter();
      },
      child: picture != null
          ? Image.memory(
              picture,
              fit: BoxFit.cover,
            )
          : Image.asset(
              'assets/images/cover.png',
              fit: BoxFit.cover,
            ),
    );
  }
}
