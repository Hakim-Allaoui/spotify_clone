import 'package:flutter/material.dart';

class SongDetailCoverImage extends StatefulWidget {
  @override
  _SongDetailCoverImageState createState() => _SongDetailCoverImageState();
}

class _SongDetailCoverImageState extends State<SongDetailCoverImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Image(
          image: AssetImage('assets/images/cover.jpg'),
          fit: BoxFit.contain, // use this
        ),
      ),
    );
  }
}