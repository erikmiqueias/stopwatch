import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchDisplay extends StatelessWidget {
  const StopwatchDisplay({super.key, required this.stopWatchTimer});
  final StopWatchTimer stopWatchTimer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: stopWatchTimer.rawTime,
      initialData: stopWatchTimer.rawTime.value,
      builder: (context, snapshot) {
        final value = snapshot.data!;
        final displayTime = StopWatchTimer.getDisplayTime(
          value,
          milliSecond: true,
          hours: false,
          minute: true,
          second: true,
        );

        return Text(
          displayTime,
          style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w500),
        );
      },
    );
  }
}
