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
