import 'package:flutter/material.dart';

import './product_item.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function removeProduct;

  ProductList(this._products, {this.removeProduct});

  // Widget _builProductItem(BuildContext context, int index) {
  //   return Product(_products[index]);
  // }

  Widget _builProductList() {
    Widget productList;
    if (_products.length > 0) {
      // productList = ListView.builder(
      //     itemBuilder: _builProductItem, itemCount: _products.length);
      productList = GridView.count(
        crossAxisCount: 2,
        children: _products.map((p) => ProductItem(p, removeProduct: removeProduct,)).toList(),
      );
    } else {
      productList = Center(
        child: Text('No products added yet!'),
      );
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return _builProductList();
  }
}
