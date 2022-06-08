import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/db_wherehouse.dart';
import '/widgets/draggable_product.dart';
import '/widgets/dragg_target.dart';

class AisleSectionScreen extends StatelessWidget {
  const AisleSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dB = Provider.of<DbWherehouse>(context);
    final arguments = ModalRoute.of(context)!.settings.arguments as Category;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showCupertinoDialog<String>(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: const Text(
                    'Deseja manter seus itens no carrinho?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.thumb_down_alt,
                        color: Colors.black,
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {},
                      child: const Icon(
                        Icons.thumb_up_alt,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF757575),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                          ),
                          height: size.height * 0.15,
                          child: Column(
                            children: const [
                              Text(
                                'Resumo de Valores',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 35.0,
                ),
              ),
              Container(
                transform: Matrix4.identity()
                  ..translate(size.width * 0.06, -size.height * 0.015),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                width: size.width * 0.04,
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    dB.getProducts(arguments, index);
                    List<Widget> draggables = List<Widget>.generate(
                      5,
                      (index) => SizedBox(
                        width: 75.0,
                        height: 75.0,
                        child: DraggableProduct(
                          genericProduct: dB.genericProduct,
                          feedback: SizedBox(
                              width: 150.0,
                              height: 200.0,
                              child: dB.genericProduct.productWidget),
                          childWhenDragging: ShaderMask(
                            child: dB.genericProduct.productWidget,
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                colors: [
                                  Colors.grey.shade900,
                                  Colors.black,
                                ],
                              ).createShader(bounds);
                            },
                          ),
                          child: dB.genericProduct.productWidget,
                        ),
                      ),
                    );
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: draggables,
                    );
                  },
                ),
              ),
              const DraggTarget()
            ],
          );
        },
      ),
    );
  }
}

//Update the AisleSectionScreen to receive the Shelves, FloorTiles ans WallTiles widgets
//And form the layout appealing of a real supermarket ailse with shelves

//The Column() needs to go and give the place to a Stack() widget
//The new widgets and components will need if and case statements to be positioned
//Add an AppBar() to the screen with two buttons, an arrow back to return to the DirectorySectionScreen
//And an supermarket_cart icon to go to the orderSummary 
//Add a warning sign at the top of the shelve to let the user know what needs to be done with the products.
