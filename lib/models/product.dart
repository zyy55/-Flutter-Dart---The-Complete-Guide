import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  //imageUrl is store in a server
  final String imageUrl;
  //changeble, so not final
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });
}
