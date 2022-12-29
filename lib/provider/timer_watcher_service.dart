import 'package:flutter/material.dart';

///ValueNotifier    => value (notify)
///ChangeNotifier   => own   (notify)
///
class NewObject {
  final String name;
  NewObject(this.name);
}

class TimeWatcherService extends ValueNotifier {
  TimeWatcherService(super.value);

  String get text => value.toString();
}
