//Import Material package.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//Import Provider package.
import 'package:provider/provider.dart';

//Import GenericProduct class
import '/ui/components/generic_product.dart';
//Import DbWherehouse class
import '/data/db_wherehouse.dart';

//Criar um statefulWidget called DraggTarget.
class DraggTarget extends StatefulWidget {
  const DraggTarget({Key? key}) : super(key: key);

  @override
  State<DraggTarget> createState() => _DraggTargetState();
}

class _DraggTargetState extends State<DraggTarget> {
  //Inside the DraggTarget state create a DbWherehouse variable and initialize it with DbWherehouse() called dB.
  DbWherehouse dB = DbWherehouse();
  ValueNotifier<int> selectedQuantity = ValueNotifier<int>(1);
  int qtd = 1;
  void upDateSelectedQuantity(String sign) {
    if (sign == '+') {
      selectedQuantity.value++;
      qtd = selectedQuantity.value;
    } else {
      selectedQuantity.value--;
      qtd = selectedQuantity.value;
    }
  }

  //Create a didChageDependecies() method and initialize dB with the Provider package.
  @override
  void didChangeDependencies() {
    dB = Provider.of<DbWherehouse>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    //Inside the build method return a DragTarget widget of DragTarget<GenericProduct>().
    List<Widget> cartProducts = List<Widget>.generate(
      dB.cartProdcuts.length,
      (index) => SizedBox(
        key: GlobalKey(debugLabel: dB.cartProdcuts[index].key.toString()),
        width: size.width * 0.2,
        height: size.height * 0.16,
        child: dB.cartProdcuts[index],
      ),
    );
    return DragTarget<GenericProduct>(
      builder: (context, candidateData, rejectedData) {
        //In its builder function proportie check if the dB.cartProducts isEmpty, if it is empty,
        //return only the supermarket_cart picture. If it is not empty, return a Stack widget
        //with the supermarket_cart on top and the dB.cartProducts above.
        if (dB.cartProdcuts.isEmpty) {
          return SizedBox(
            width: size.width,
            height: size.height * 0.3,
            child: Image.asset(
              'lib/assets/images/scene/supermarket_cart.png',
              fit: BoxFit.contain,
            ),
          );
        } else {
          //In its onAccept: (data){} function property call the setState method with the dB.getCartProducts(data).
          //And then call the showDialog<void>() method for Android and showCupertinoDialog<void>() for iOS that will
          //be in its respective files.
          return Stack(
            children: [
              Positioned(
                left: size.width * 0.4,
                bottom: size.height * 0.08,
                child: Stack(
                  children: cartProducts,
                ),
              ),
              SizedBox(
                width: size.width,
                height: size.height * 0.3,
                child: Image.asset(
                  'lib/assets/images/scene/supermarket_cart.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          );
        }
      },
      onAccept: (productData) async {
        showCupertinoDialog<String>(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text(
                'Confirmar Quantidade',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              content: ValueListenableBuilder(
                valueListenable: selectedQuantity,
                builder: (context, value, child) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    selectedQuantity.value == 0
                        ? TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            '${selectedQuantity.value}',
                            style: const TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                            ),
                          ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    Expanded(
                      child: CupertinoDialogAction(
                        onPressed: () =>
                            setState(() => upDateSelectedQuantity('-')),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CupertinoDialogAction(
                        onPressed: () =>
                            setState(() => upDateSelectedQuantity('+')),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    dB.getOrderPartial(productData, qtd);
                    dB.saveCartProducts(productData);
                    setState(() {
                      selectedQuantity.value = 1;
                      qtd = 1;
                    });
                  },
                  child: const Text(
                    'Adicionar',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
