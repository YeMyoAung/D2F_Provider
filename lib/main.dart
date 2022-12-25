import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/provider/mulit_selector_provider.dart';
import 'package:provider_example/provider/note_service.dart';
import 'package:provider_example/provider/tag_service.dart';
import 'package:provider_example/screen/create_note_screen.dart';
import 'package:provider_example/screen/home_screen.dart';
import 'package:provider_example/screen/multi_selector_screen.dart';
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

Future<int> getRandomFuture() async {
  await Future.delayed(const Duration(seconds: 3));
  return Random.secure().nextInt(100) + 20;
}

Stream<String> getTime() async* {
  int i = 0;
  while (i < 10) {
    i++;
    yield DateTime.now().toString();
  }
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
              return createRoute(MultiProvider(
                providers: [
                  FutureProvider(
                    create: (_) => getRandomFuture(),
                    initialData: 0,
                  ),
                  StreamProvider(
                    create: (_) => getTime(),
                    initialData: '',
                  ),
                  ChangeNotifierProvider(create: (_) => ProductPrice()),
                  ChangeNotifierProvider(create: (_) => CouponDiscount()),
                  ChangeNotifierProvider(create: (_) => ShippingPrice()),
                ],
                child: const MultiSelectorScreen(),
              )

                  // ChangeNotifierProvider(
                  //   create: (context) => CouponDiscount(),
                  //   child: ChangeNotifierProvider(
                  //     create: (context) => ShippingPrice(),
                  //     child: ChangeNotifierProvider(
                  //       create: (context) => ProductPrice(),
                  //       child: const MultiSelectorScreen(),
                  //     ),
                  //   ),
                  // ),
                  );
            case '/tag':
              return createRoute(
                ChangeNotifierProvider(
                  lazy: true,
                  create: (_) => TagService(),
                  child: const TagScreen(
                    name: "hello world",
                  ),
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
