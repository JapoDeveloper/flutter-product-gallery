import 'package:flutter/material.dart';

import '../custom_drawer.dart';
import './products_page.dart';

class ManageProductPage extends StatelessWidget {
  final Function addProduct;

  ManageProductPage({this.addProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage product'),
      ),
      drawer: CustomDrawer(),
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
