import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'dart:async';

class StopwatchDisplay extends StatefulWidget {
  const StopwatchDisplay({super.key, required this.stopWatchTimer});
  final StopWatchTimer stopWatchTimer;

  @override
  State<StopwatchDisplay> createState() => _StopwatchDisplayState();
}

class _StopwatchDisplayState extends State<StopwatchDisplay> {
  final ValueNotifier<int> _valueNotifier = ValueNotifier<int>(0);
  late final StreamSubscription<int> _subscription;

  @override
  void initState() {
    super.initState();

    _valueNotifier.value = widget.stopWatchTimer.rawTime.value;

    _subscription = widget.stopWatchTimer.rawTime.listen((value) {
      _valueNotifier.value = value;
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _valueNotifier,
      builder: (context, value, _) {
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
