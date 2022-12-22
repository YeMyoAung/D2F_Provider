import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../changenotifier/simple_chanagenotifier_example.dart';

class Aa extends ChangeNotifier {
  String name = 'Aye Aye';
  int mark = 0;

  void increment() {
    mark++;
    print(mark);
    notifyListeners();
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return ChangeNotifierProvider(
                create: (_) => Aa(),
                child: const SimpleChangeNotifierExample(),
              );
            }));
          },
          child: const Text("Go To Next Screen"),
        ),
      ),
    );
  }
}
