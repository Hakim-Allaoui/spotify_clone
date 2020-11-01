import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/utils/tools.dart';

class SpSlider extends StatefulWidget {
  final Duration currentPosition;
  final Duration duration;
  final Function(Duration) seekTo;

  const SpSlider({
    @required this.currentPosition,
    @required this.duration,
    @required this.seekTo,
  });

  @override
  _SpSliderState createState() => _SpSliderState();
}

class _SpSliderState extends State<SpSlider> {
  Duration _visibleValue;
  bool listenOnlyUserInterraction = false;
  double get percent => widget.duration.inMilliseconds == 0
      ? 0
      : _visibleValue.inMilliseconds / widget.duration.inMilliseconds;

  @override
  void initState() {
    super.initState();
    _visibleValue = widget.currentPosition;
  }

  @override
  void didUpdateWidget(SpSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listenOnlyUserInterraction) {
      _visibleValue = widget.currentPosition;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 2.0,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5.0),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0),
            ),
            child: Slider(
              min: 0,
              max: widget.duration.inMilliseconds.toDouble(),
              value: percent * widget.duration.inMilliseconds.toDouble(),
              onChangeEnd: (newValue) {
                setState(() {
                  listenOnlyUserInterraction = false;
                  widget.seekTo(_visibleValue);
                });
              },
              onChangeStart: (_) {
                setState(() {
                  listenOnlyUserInterraction = true;
                });
              },
              onChanged: (newValue) {
                print(
                    '========================> Onchange value : $newValue');
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
    );
  }
}