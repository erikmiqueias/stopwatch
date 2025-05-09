import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:stopwatch/stopwatch_display.dart';
import 'package:stopwatch/widgets/stopwatch_button.dart';

class Stopwatch extends StatefulWidget {
  const Stopwatch({super.key, required this.title});
  final String title;

  @override
  State<Stopwatch> createState() => _StopwatchState();
}

class _StopwatchState extends State<Stopwatch> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  static bool _isStop = true;

  void _startStop() {
    if (_isStop) {
      _stopWatchTimer.onStartTimer();
    } else {
      _stopWatchTimer.onStopTimer();
    }

    setState(() {
      _isStop = !_isStop;
    });
  }

  void _reset() {
    _stopWatchTimer.onResetTimer();

    setState(() {
      _isStop = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [StopwatchDisplay(stopWatchTimer: _stopWatchTimer)],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 50,
            children: [
              StopwatchButton(
                icon:
                    _isStop
                        ? const Icon(Icons.play_arrow, color: Colors.blueAccent)
                        : const Icon(Icons.pause, color: Colors.blueAccent),
                onPressed: _startStop,
                isStop: _isStop,
              ),
              StopwatchButton(
                icon: const Icon(Icons.restart_alt, color: Colors.blueAccent),
                onPressed: _reset,
                isStop: _isStop,
              ),
            ],
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
