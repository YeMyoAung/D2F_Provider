import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_example/provider/number_api_service.dart';

final DogCeoApiNotifier dogCeoApiNotifier =
    DogCeoApiNotifier(DogModel(message: '', status: ''));

class NumberApiScreen extends StatefulWidget {
  const NumberApiScreen({Key? key}) : super(key: key);

  @override
  State<NumberApiScreen> createState() => _NumberApiScreenState();
}

class _NumberApiScreenState extends State<NumberApiScreen> {
  final NumberApiNotifier notifer = NumberApiNotifier('');
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    notifer.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ValueListenableBuilder(
          builder: (_, generic, child) {
            ///child => rebuild
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) {
                            return ValueAccept();
                          },
                          settings: RouteSettings(
                            arguments: dogCeoApiNotifier,
                          )));
                },
                child: Image.network(generic.message));
            // return Text(
            //   generic.text,
            //   style: TextStyle(
            //     fontSize: 45,
            //     color: Colors.green,
            //   ),
            // );
          },
          valueListenable: dogCeoApiNotifier,
          child: Text("hello"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          http
              .get(Uri.parse("https://dog.ceo/api/breeds/image/random"))
              .then((value) {
            final decode = json.decode(value.body);
            dogCeoApiNotifier.value =
                DogModel(message: decode['message'], status: decode['status']);
            // notifer.value = value.body;
            // controller.text = value.body;
          });
        },
      ),
    );
  }
}

class ValueAccept extends StatelessWidget {
  const ValueAccept({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ValueAccept Screen"),
      ),
      body: Center(
        child: Text(dogCeoApiNotifier.value.message),
      ),
    );
  }
}
