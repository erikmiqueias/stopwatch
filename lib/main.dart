import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stopwatch/stopwatch.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(home: const Stopwatch(title: 'Stopwatch')));
}
