import 'dart:math';

import 'package:flutter/material.dart';

const List<String> tags = [
  'Personal',
  'Family',
  'Business',
  'Daily Task',
  'Movies'
];

///Selectorမသုံးဘဲ
///Consumer, context.watch တွေသုံးမယ်ဆိုရင်
///notifyListenersကို ခေါ်တိုင်း
///သက်ဆိုင်ရင် Provider Classထဲမှာရှိတဲ့
///variableတွေကို သုံးထားတဲ့
///Widgetတိုင်းပြန်ပြီးတည်ဆောက်ခြင်းခံရမယ်
///
///Selectorကိုသုံးမယ်ဆိုရင်တော့
///Selectorက သူ selectလုပ်ထားတဲ့
///Providerထဲမှာရှိတဲ့ သူ selectလုပ်တဲ့ variableအပြောင်းအလဲဖြစ်မှသာ
///Widgetကိုပြန်လည်တည်ဆောက်မှာ

class TagService extends ChangeNotifier {
  TagService() {
    print("TagService is create");
  }

  ///Changes
  final List<String> selected = [];

  ///Widget 20
  List<String> helloworld = [];
  List<String> users = [];

  DateTime date = DateTime.now();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? select = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(
        const Duration(days: 365 * 1000),
      ),
    );
    if (select != null) {
      date = select;
      notifyListeners();

      ///== setstate
    }
  }

  void select(String value) {
    if (selected.contains(value)) {
      selected.remove(value);
    } else {
      selected.add(value);
    }
    notifyListeners();
  }
}

class TagServiceTwo extends ChangeNotifier {
  TagServiceTwo() {
    print("TagServiceTwo is create");
  }
  int i = 0;

  void add() {
    i = Random.secure().nextInt(5);
    notifyListeners();
  }
}

class TagServiceThree extends ChangeNotifier {
  TagServiceThree() {
    print('TagServiceThree');
  }
  int i = 0;
}

// TagService();
// TagServiceTwo();
// TagServiceThree();
