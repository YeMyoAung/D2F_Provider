import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

/// Provider(
/// create:() => KtvProvider(),
/// child:MaterialApp(
///       home: KtvLightExample()
///   )
/// )
class KtvLightExample extends StatelessWidget {
  const KtvLightExample({super.key});

  @override
  Widget build(BuildContext context) {
    // print({} == {});

    ///Provider => ChangeNotifierProvider
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,

        ///watch => changes
        color: context.watch<KtvProvider>().lightColor,
        child: const Text(
          "KTV Light",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(context.watch<KtvProvider>().isPlaying
            ? Icons.pause
            : Icons.play_arrow),
        onPressed: () {
          ///read => action
          ///
          ///Provider.of => listen true => watch
          ///Provider.of => listen false => read
          Provider.of<KtvProvider>(context, listen: false).playPause();
        },
      ),
    );
  }
}
