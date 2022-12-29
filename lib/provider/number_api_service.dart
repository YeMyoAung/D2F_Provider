import 'package:flutter/cupertino.dart';

class NumberApiNotifier extends ValueNotifier<String> {
  NumberApiNotifier(super.value);
}

class DogModel {
  final String message, status;
  DogModel({
    required this.message,
    required this.status,
  });
}

class DogCeoApiNotifier extends ValueNotifier<DogModel> {
  DogCeoApiNotifier(super.value);
}
