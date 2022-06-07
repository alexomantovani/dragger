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
    return Scaffold(
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
