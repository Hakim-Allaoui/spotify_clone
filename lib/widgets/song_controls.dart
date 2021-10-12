import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/utils/tools.dart';
import 'package:spotify_clone/widgets/clickable_text.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class SongDetailControls extends StatefulWidget {
  final Duration duration;
  final Duration currentPosition;
  final bool isPlaying;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onPlay;
  final Function(Duration) seekTo;
  final Function(bool) intreptu;

  const SongDetailControls({Key key, this.duration = Duration.zero, this.currentPosition, this.onPrevious, this.onNext, this.onPlay, this.isPlaying = false, this.seekTo, this.intreptu})
      : super(key: key);

  @override
  _SongDetailControlsState createState() => _SongDetailControlsState();
}

class _SongDetailControlsState extends State<SongDetailControls> {
  bool favorited = false;
  int shuffleMode = 0;
  int loopMode = 0;
  bool listenOnlyUserInterraction = false;
  Duration _visibleValue;

  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(SongDetailControls oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

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
                        text: 'Track title',
                        textStyle: HKTextStyles.kTitleTextStyle,
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      ClickableText(
                        title: 'Artist',
                        text: 'Artist name',
                        textStyle: HKTextStyles.kSubTitleTextStyle,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      favorited = !favorited;
                    });
                  },
                  child: SvgPicture.asset(
                    favorited
                        ? 'assets/icons/heart_fill.svg'
                        : 'assets/icons/heart.svg',
                    height: 18.0,
                    width: 18.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20.0),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: 3.0,
                    thumbShape:
                    RoundSliderThumbShape(enabledThumbRadius: 5.0),
                    overlayShape:
                    RoundSliderOverlayShape(overlayRadius: 15.0),
                  ),
                  child: Slider(
                    min: 0,
                    max: widget.duration.inMilliseconds.toDouble() + 1000,
                    value: percent *
                        widget.duration.inMilliseconds.toDouble(),
                    inactiveColor: HKColors.white.withOpacity(0.1),
                    activeColor: HKColors.white,
                    onChangeEnd: (newValue) {
                      widget.intreptu(false);
                      setState(() {
                        listenOnlyUserInterraction = false;
                        widget.seekTo(_visibleValue);
                      });
                    },
                    onChangeStart: (_) {
                      widget.intreptu(true);
                      setState(() {
                        listenOnlyUserInterraction = true;
                      });
                    },
                    onChanged: (newValue) {
                      setState(() {
                        final to = Duration(milliseconds: newValue.floor());
                        _visibleValue = to;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Tools.durationToString(widget.currentPosition),
                      style: HKTextStyles.timeTextStyle,
                    ),
                    Text(
                      Tools.durationToString(widget.duration),
                      style: HKTextStyles.timeTextStyle,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (shuffleMode < 2)
                            shuffleMode++;
                          else
                            shuffleMode = 0;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/shuffle.svg',
                        color: shuffleMode == 0
                            ? HKColors.white
                            : HKColors.green,
                        height: 18.0,
                        width: 18.0,
                      ),
                    ),
                    shuffleMode == 2
                        ? SvgPicture.asset(
                      'assets/icons/dot.svg',
                      height: 4.0,
                      width: 4.0,
                    )
                        : SizedBox(),
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => widget.onPrevious(),
                        icon: SvgPicture.asset(
                          'assets/icons/next.svg',
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                      SizedBox(width: 25.0),
                      GestureDetector(
                        onTap: () => widget.onPlay(),
                        child: Container(
                          // padding: EdgeInsets.all(8.0),
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            color: HKColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              widget.isPlaying
                                  ? 'assets/icons/pause.svg'
                                  : 'assets/icons/play.svg',
                              height: 24.0,
                              width: 24.0,
                              color: HKColors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0),
                      IconButton(
                        onPressed: () => widget.onNext(),
                        icon: SvgPicture.asset(
                          'assets/icons/back.svg',
                          height: 25.0,
                          width: 25.0,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (loopMode < 2)
                            loopMode++;
                          else
                            loopMode = 0;
                        });
                      },
                      child: SvgPicture.asset(
                        'assets/icons/repeat.svg',
                        color: loopMode == 0
                            ? HKColors.white
                            : HKColors.green,
                        height: 18.0,
                        width: 18.0,
                      ),
                    ),
                    loopMode == 2
                        ? SvgPicture.asset(
                      'assets/icons/dot.svg',
                      height: 4.0,
                      width: 4.0,
                    )
                        : SizedBox(),
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
}
