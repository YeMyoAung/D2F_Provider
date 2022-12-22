import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'changenotifier/second_example_chanagenotifier_example.dart';

class KtvProvider extends ChangeNotifier {
  Color lightColor = Colors.green;
  bool isPlaying = false;

  Timer? timer;

  ///

  void playPause() {
    timer?.cancel();
    timer = null;

    isPlaying = !isPlaying;

    if (isPlaying) {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        lightColor = Color.fromRGBO(Random.secure().nextInt(255),
            Random.secure().nextInt(255), Random.secure().nextInt(255), 1);

        notifyListeners();
      });
    }

    notifyListeners();
  }
}

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => KtvProvider(),
        child: const KtvLightExample(),
      ),
    ),
  );
}
