import 'package:flutter/material.dart';

import '../product_list.dart';
import '../custom_drawer.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _products;
  final Function addProduct;
  final Function removeProduct;

  HomePage(this._products, this.addProduct, this.removeProduct);
  
  Widget _buildToolbarPanel() {
    return Row(children: [
      Expanded(
          child: Text(
        '${_products.length} products',
        textAlign: TextAlign.right,
      ))
    ]);
  }

  List<Widget> _buildDrawerOptions(BuildContext context){
    return [
       ListTile(
            title: Text('Manage Product'),
            onTap: () => Navigator.pushNamed(context, '/admin'),
          ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyLists'),
      ),
      drawer: CustomDrawer(options:_buildDrawerOptions(context)),
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
              removeProduct: removeProduct,
            ))
          ],
        ),
      )),
    );
  }

}
