//Import Material package.
import 'package:flutter/material.dart';
import 'package:dragger/ui/components/generic_product.dart';

//Create a statelessWidget called DraggableProduct.
class DraggableProduct extends StatelessWidget {
//Create a final variable of GenericProduct type. This variable will be called genericProduct.
  final GenericProduct genericProduct;
//Create a final variable of Widget type. This variable will be called child.
  final Widget child;
//Create a final variable of Widget type. This variable will be called feedback.
  final Widget feedback;
//Create a final variable of ShaderMask type. This variable will be called childWhenDragging.
  final ShaderMask childWhenDragging;

//Pass all the final variables to the constructor as required properties.
  const DraggableProduct(
      {Key? key,
      required this.genericProduct,
      required this.child,
      required this.feedback,
      required this.childWhenDragging})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Inside the build method return a Draggable<GenericProduct> and pess it all the final variables
    //created in the constructor to its respective properties in the Draggable widget, GenectProduct will
    //be the data type of the data property.
    return Draggable<GenericProduct>(
      data: genericProduct,
      feedback: feedback,
      childWhenDragging: childWhenDragging,
      child: child,
    );
  }
}
