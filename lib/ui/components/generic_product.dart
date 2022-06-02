//Import Material package
import 'package:flutter/material.dart';

//Create class GenericProduct
class GenericProduct {
  //Inside the class declare 4 final variables:
  //String productId, double productPrice, int productInventoryCount, Widget productWidget.
  final String productId;
  final String productImageUrl;
  final double productPrice;
  final int productInventoryCount;
  final Widget productWidget;

  //Initialize them all as required inside the constructor
  GenericProduct({
    required this.productId,
    required this.productImageUrl,
    required this.productPrice,
    required this.productInventoryCount,
    required this.productWidget,
  });
}
