import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatelessWidget {
  static const routeName = '/filters';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      //when we don't want to go back, we can comment this
      //in the situation of, after login disapear the option to go back
      drawer: MainDrawer(),
      body: Center(
        child: Text('The Favorites'),
      ),
    );
  }
}
