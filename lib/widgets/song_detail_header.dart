import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/widgets/clickable_text.dart';

class SongDetailHeader extends StatefulWidget {
  @override
  _SongDetailHeaderState createState() => _SongDetailHeaderState();
}

class _SongDetailHeaderState extends State<SongDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/icons/down_chevron.svg',
            height: 10.0,
            width: 10.0,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ClickableText(
                title: 'PLAYING FROM',
                text: 'PLAYING FROM PLAYLIST',
                textStyle: HKTextStyles.kCaptionTextStyle,
              ),
              SizedBox(
                height: 2.0,
              ),
              ClickableText(
                title: 'Playlist/Album Title',
                text: 'My Playlist/Album',
                textStyle: HKTextStyles.kBodyTextStyle,
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: SvgPicture.asset(
            'assets/icons/actions.svg',
            height: 20.0,
            width: 20.0,
          ),
        ),
      ],
    );
  }
}