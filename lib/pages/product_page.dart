import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, String> _product;

  ProductPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_product['title']),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(_product['image']),
            SizedBox(
              height: 10.0,
            ),
            Text(_product['title']),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  color: Theme.of(context).accentColor,
                  child: Row(children: [
                    Icon(Icons.delete, color: Colors.blueGrey,),
                    Text('Delete')]),
                  onPressed: () => Navigator.pop(context,{'remove':true}),
                )
              ],
            )
          ],
        ));
  }
}
