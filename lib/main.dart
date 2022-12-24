import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/note_service.dart';
import 'package:provider_example/provider/tag_service.dart';
import 'package:provider_example/screen/create_note_screen.dart';
import 'package:provider_example/screen/home_screen.dart';
import 'package:provider_example/screen/tag_screen.dart';

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
  // runApp(
  // MaterialApp(
  //   home: ChangeNotifierProvider(
  //     create: (_) => KtvProvider(),
  //     child: const KtvLightExample(),
  //   ),
  // ),
  // );
  runApp(const MyApp());
}

Route createRoute(Widget child) {
  return MaterialPageRoute(builder: (_) => child);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteService(),
      child: MaterialApp(
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return createRoute(const HomeScreen());
            case '/tag':
              return createRoute(
                ChangeNotifierProvider(
                  create: (_) => TagService(),
                  child: const TagScreen(),
                ),
              );
            case '/create':
              return createRoute(ChangeNotifierProvider.value(
                value: settings.arguments as TagService,
                // create: (_) => TagService(),
                child: const CreateNoteScreen(),
              ));
            default:
              return createRoute(const HomeScreen());
          }
        },
      ),
    );
  }
}
