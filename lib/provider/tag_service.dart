import 'package:flutter/material.dart';

const List<String> tags = [
  'Personal',
  'Family',
  'Business',
  'Daily Task',
  'Movies'
];

class TagService extends ChangeNotifier {
  ///Changes
  final List<String> selected = [];

  void select(String value) {
    if (selected.contains(value)) {
      selected.remove(value);
    } else {
      selected.add(value);
    }
    notifyListeners();
  }
}
