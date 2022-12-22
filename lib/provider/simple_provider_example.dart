import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final Provider<int> provider = Provider(create: (context) {
  return 1;
});

class SimpleProviderExample extends StatelessWidget {
  const SimpleProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Provider(
          create: (context) {
            return 1;
          },
          child: const Text("hello"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
