import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/utils/tools.dart';
import 'package:spotify_clone/widgets/cover_image.dart';
import 'package:spotify_clone/widgets/song_controls.dart';
import 'package:spotify_clone/widgets/song_detail_header.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HKColors.black,
      body: SingleChildScrollView(
        child: Container(
          height: Tools.height,
          width: Tools.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xff426574),
                const Color(0xff161819),
              ],
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.8),
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SongDetailHeader(),
                ),
                Expanded(child: SongDetailCoverImage()),
                SongDetailControls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
 }
