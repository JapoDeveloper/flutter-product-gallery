import 'package:flutter/material.dart';

import '../custom_drawer.dart';
import './products_page.dart';

class ManageProductPage extends StatelessWidget {
  final Function addProduct;

  ManageProductPage({this.addProduct});

  List<Widget> _buildDrawerOptions(BuildContext context) {
    return [
      ListTile(
          title: Text('All Products'),
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProductsPage()))),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage product'),
      ),
      drawer: CustomDrawer(options:_buildDrawerOptions(context)),
      body: Center(
        child: RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () {
            if (addProduct != null) {
              addProduct();
            }
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ProductsPage()));
          },
          child: Text('Add Product'),
        ),
      ),
    );
  }
}
