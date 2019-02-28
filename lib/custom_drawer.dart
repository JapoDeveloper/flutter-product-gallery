import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  List<Widget> options;

  CustomDrawer({this.options});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      AppBar(
        automaticallyImplyLeading: false,
        title: Text('Settings'),
      ),
    ];
    if (options != null) {
      widgets.addAll(options);
    }
    //Include other Drawer widgets here
    //widgets.add(_your_widget_here)

    return Drawer(
      child: Column(
        children: widgets,
      ),
    );
  }
}
