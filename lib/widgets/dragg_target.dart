//Import Material package.
import 'package:dragger/data/db_wherehouse.dart';
import 'package:flutter/material.dart';
//Import Provider package.
import 'package:provider/provider.dart';

//Import GenericProduct class
import '/ui/components/generic_product.dart';

//Criar um statefulWidget called DraggTarget.
class DraggTarget extends StatefulWidget {
  const DraggTarget({Key? key}) : super(key: key);

  @override
  State<DraggTarget> createState() => _DraggTargetState();
}

class _DraggTargetState extends State<DraggTarget> {
  //Inside the DraggTarget state create a DbWherehouse variable and initialize it with DbWherehouse() called dB.
  DbWherehouse dB = DbWherehouse();

  //Create a didChageDependecies() method and initialize dB with the Provider package.
  @override
  void didChangeDependencies() {
    dB = Provider.of<DbWherehouse>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //Inside the build method return a DragTarget widget of DragTarget<GenericProduct>().
    return DragTarget<GenericProduct>(
      builder: (context, candidateData, rejectedData) {
        //In its builder function proportie check if the dB.cartProducts isEmpty, if it is empty,
        //return only the supermarket_cart picture. If it is not empty, return a Stack widget
        //with the supermarket_cart on top and the dB.cartProducts above.
        if (dB.cartProdcuts.isEmpty) {
          return SizedBox(
            child: Image.asset(''),
          );
        } else {
          //In its onAccept: (data){} function property call the setState method with the dB.getCartProducts(data).
          //And then call the showDialog<void>() method for Android and showCupertinoDialog<void>() for iOS that will
          //be in its respective files.
          return Stack(
            children: const [],
          );
        }
      },
      onAccept: (productData) {
        setState(() {
          dB.saveCartProducts(productData);
        });
      },
    );
  }
}
