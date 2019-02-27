import 'package:flutter/material.dart';
import './pages/product_page.dart';

class ProductItem extends StatelessWidget {
  final Map<String, String> _product;
  final Function removeProduct;

  ProductItem(this._product,{this.removeProduct});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(
            _product['image'],
            height: 100.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            _product['title'],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push<dynamic>(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductPage(_product))
                        ).then((dynamic value) {
                          if(value != null && value['remove']){
                            removeProduct(_product);
                          }
                        }),
              )
            ],
          )
        ],
      ),
    );
  }
}
