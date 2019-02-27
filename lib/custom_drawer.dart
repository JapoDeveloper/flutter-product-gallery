import 'package:flutter/material.dart';

import './pages/products_page.dart';
import './pages/manage_product_page.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text('Settings'),
          ),
          ListTile(
            title: Text('Manage Product'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManageProductPage())),
          ),
          ListTile(
            title: Text('List Products'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ProductsPage())),
          )
        ],
      ),
    );
  }
}
