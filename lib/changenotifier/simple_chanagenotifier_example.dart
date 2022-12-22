import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_example/page/page_one.dart';

// *
///ChangeNotiferProvider

class SimpleNotifer extends ChangeNotifier {
  int i = 0;
  String username = 'mg mg';
}

// ChangeNotifierProvider(child:SimpleChangeNotifierExample());

class SimpleChangeNotifierExample extends StatelessWidget {
  const SimpleChangeNotifierExample({super.key});

  @override
  Widget build(BuildContext context) {
    print("ui is build");
    return ChangeNotifierProvider(
      create: (_) {
        return SimpleNotifer();
      },
      builder: (context, child) {
        // context.read();       => new
        // Provider.of(context); => Old

        return Scaffold(
          body: Center(
            child: Text(context.watch<Aa>().mark.toString()),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              ///context,
              ///Prod
              Provider.of<Aa>(context, listen: false).increment();
            },
            child: const Icon(Icons.add),
          ),
        );
      },

      // child: Scaffold(
      //   body: Center(
      //     child: Text(context.read<SimpleNotifer>().username),
      //   ),
      // ),
    );
  }
}
