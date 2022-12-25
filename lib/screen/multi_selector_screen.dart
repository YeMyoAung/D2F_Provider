import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/mulit_selector_provider.dart';

class MultiSelectorScreen extends StatelessWidget {
  const MultiSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Multi Selector Screen"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Total: "),
                Selector3<ProductPrice, CouponDiscount, ShippingPrice, double>(
                  builder: (_, value, child) {
                    print('rebuild');
                    return Text(
                      value.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    );
                  },
                  selector: (_, productprice, coupondiscount, shippingprice) {
                    return ((products[productprice.selected] ?? 0) +
                            (shipping[shippingprice.selected] ?? 0)) -
                        (coupons[coupondiscount.selected] ?? 0);
                  },
                  shouldRebuild: (current, changes) {
                    return true;
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                context.read<ProductPrice>().select(value);
              },
              decoration: const InputDecoration(
                hintText: "Product Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                context.read<CouponDiscount>().select(int.tryParse(value) ?? 0);
              },
              decoration: const InputDecoration(
                hintText: "Coupon Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                context.read<ShippingPrice>().select(value);
              },
              decoration: const InputDecoration(hintText: "City Name"),
            ),
          ),
          Text(context.watch<int>().toString()),
          Text(context.watch<String>().toString()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(context.read<String>());
        },
      ),
    );
  }
}
