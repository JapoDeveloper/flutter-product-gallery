import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final Map<String, String> _product;

  ProductPage(this._product);

  void _showDeleteWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Are you sure?'),
            content: Text('This action cannot be undone.'),
            actions: <Widget>[
              RaisedButton(
                color: Colors.redAccent,
                textColor: Colors.blueGrey,
                child: Text('DISCARD'),
                onPressed: () => Navigator.pop(context),
              ),
              RaisedButton(
                color: Colors.greenAccent,
                textColor: Colors.blueGrey,
                child: Text('ACCEPT'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, {'remove': true});
                },
              ),
            ],
          ),
    );
  }

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
                    Icon(
                      Icons.delete,
                      color: Colors.blueGrey,
                    ),
                    Text('Delete')
                  ]),
                  onPressed: () => _showDeleteWarning(context),
                )
              ],
            )
          ],
        ));
  }
}
