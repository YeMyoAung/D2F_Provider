import 'package:flutter/material.dart';

Map<String, double> products = {
  'apple': 500,
  'a': 500,
  'p': 500,
  'l': 500,
  'e': 500,
  'orange': 200,
  'pen': 300,
  'pencil': 150,
  'book': 400,
};

///300+1200 = 1500

class ProductPrice extends ChangeNotifier {
  String selected = '';

  void select(String value) {
    selected = value;
    notifyListeners();
  }
}

Map<int, double> coupons = {
  1001: 200,
  3056: 100,
  8805: 400,
  8218: 600,
};

class CouponDiscount extends ChangeNotifier {
  int selected = 0;

  void select(int value) {
    selected = value;
    notifyListeners();
  }
}

Map<String, double> shipping = {
  'mandalay': 2000,
  'yangon': 1200,
  'pyinoolwin': 3000,
};

class ShippingPrice extends ChangeNotifier {
  String selected = '';

  void select(String value) {
    selected = value;
    notifyListeners();
  }
}
