import 'package:flutter/material.dart';

class ProductListPage extends StatelessWidget {
  final List<Map<String, String>> _products;

  ProductListPage(this._products);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _products
          .map((_product) => Container(
              padding: EdgeInsets.all(10.0),
              child: Row(children: [
                Image.asset(
                  _product['image'],
                  width: 64.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(_product['title'])
              ])))
          .toList(),
    );
  }
}
