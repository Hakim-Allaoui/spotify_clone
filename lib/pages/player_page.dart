import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_clone/utils/theme.dart';
import 'package:spotify_clone/utils/tools.dart';
import 'package:spotify_clone/widgets/cover_image.dart';
import 'package:spotify_clone/widgets/song_controls.dart';
import 'package:spotify_clone/widgets/song_detail_header.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PlayerPage extends StatefulWidget {
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  bool isPlaying = false;
  Duration duration = Duration(minutes: 3, seconds: 12);

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.setPresetTime(mSec: 0);
    /*_stopWatchTimer.rawTime.listen((value) {
      if(value == duration.inMilliseconds - 1000){
        _stopWatchTimer.dispose();
        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
        _stopWatchTimer.setPresetTime(mSec: 0);
      }
      print('=============================> hello I\'m listening on $value / ${duration.inMilliseconds}');
    });*/
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

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
                SongDetailHeader(),
                Expanded(
                  child: SongDetailCoverImage(),
                ),
                StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: 0,
                    builder: (context, snapshot) {
                      final value = snapshot.data;
                      if (value >= duration.inMilliseconds) {
                        _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                        isPlaying = false;
                      }
                      return SongDetailControls(
                        duration: duration,
                        currentPosition: Duration(milliseconds: value),
                        isPlaying: isPlaying,
                        onPlay: () {
                          isPlaying
                              ? _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.stop)
                              : _stopWatchTimer.onExecute
                                  .add(StopWatchExecute.start);
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                        onPrevious: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                          _stopWatchTimer.setPresetTime(mSec: 0);
                          _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                          if (isPlaying)
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                        },
                        onNext: () {
                          _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
                          _stopWatchTimer.setPresetTime(mSec: 0);
                          _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
                          if (isPlaying)
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                        },
                        seekTo: (to) {
                          setState(() {
                            _stopWatchTimer.setPresetTime(
                                mSec: to.inMilliseconds);
                          });
                        },
                        intreptu: (val) {
                          if (isPlaying)
                            _stopWatchTimer.onExecute.add(val
                                ? StopWatchExecute.stop
                                : StopWatchExecute.start);
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
