import 'package:flutter/material.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //it's a screen, so need a scaffold
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MyShop',
        ),
      ),
      //only rendering the items that are on the screen and not rendering the items that are not on the screen
      body: new ProductsGrid(),
    );
  }
}
