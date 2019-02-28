import 'dart:math';
import 'package:flutter/material.dart';

import './pages/home_page.dart';
import './pages/products_admin_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _products;
  final List<String> images = [
    'assets/food1.jpg',
    'assets/food2.jpg',
    'assets/food3.jpg',
    'assets/food4.jpg'
  ];
  Random rndGenerator = new Random();
  int nextId;

  @override
  void initState() {
    super.initState();
    this._products = [];
    this._products.add({'title': 'Product 1', 'image': images[0]});
    this._products.add({'title': 'Product 2', 'image': images[1]});
    this._products.add({'title': 'Product 3', 'image': images[2]});
    this._products.add({'title': 'Product 4', 'image': images[3]});
    this.nextId = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, accentColor: Colors.greenAccent),
      routes: _getRoutes(),
    );
  }

  dynamic _getRoutes() {
    return {
      '/': (BuildContext context) =>
          HomePage(_products, _addProduct, _removeProduct),
      '/admin': (BuildContext context) => ProductsAdminPage(_products,_addProduct, _removeProduct),
    };
  }

  void _addProduct() {
    setState(() {
      nextId++;
      int imgIndex = rndGenerator.nextInt(4);
      _products.add({'title': 'Product $nextId', 'image': images[imgIndex]});
    });
  }

  void _removeProduct(Map<String, String> product) {
    setState(() {
      _products.remove(product);
    });
  }
}
