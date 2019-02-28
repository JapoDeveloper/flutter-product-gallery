import 'package:flutter/material.dart';

import './product_create_page.dart';
import './product_list_page.dart';

import '../custom_drawer.dart';

class ProductsAdminPage extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function removeProduct;

  ProductsAdminPage(this.products, this.addProduct, this.removeProduct);

  List<Widget> _buildDrawerOptions(BuildContext context) {
    return [
      ListTile(
          title: Text('All Products'),
          onTap: () => Navigator.pushNamed(context, '/')),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: Text('Manage product'),
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.edit),
                    text: 'Create Product',
                  ),
                  Tab(
                    icon: Icon(Icons.list),
                    text: 'My Products',
                  )
                ],
              )),
          drawer: CustomDrawer(options: _buildDrawerOptions(context)),
          body: TabBarView(
            children: <Widget>[ProductCreatePage(), ProductListPage(products)],
          ),
        ));
  }
}
