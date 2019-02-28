import 'package:flutter/material.dart';
import 'dart:math';

import '../pages/manage_product_page.dart';

import '../product_list.dart';
import '../custom_drawer.dart';

class ProductsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductPageState();
  }
}

class _ProductPageState extends State<ProductsPage> {
  List<Map<String, String>> _products;
  List<String> images = [
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
    this._products.add({'title':'Product 1', 'image': images[0]});
    this._products.add({'title':'Product 2', 'image': images[1]});
    this._products.add({'title':'Product 3', 'image': images[2]});
    this._products.add({'title':'Product 4', 'image': images[3]});
    this.nextId = 0;
  }

  Widget _buildToolbarPanel() {
    return Row(children: [
      Expanded(
          child: Text(
        '${_products.length} products',
        textAlign: TextAlign.right,
      ))
    ]);
  }

  List<Widget> _buildDrawerOptions(){
    return [
       ListTile(
            title: Text('Manage Product'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManageProductPage())),
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyLists'),
      ),
      drawer: CustomDrawer(options:_buildDrawerOptions()),
      body: Container(
          child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            _buildToolbarPanel(),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: ProductList(
              _products,
              removeProduct: _removeProduct,
            ))
          ],
        ),
      )),
    );
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
