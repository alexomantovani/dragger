import 'package:dragger/widgets/draggable_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/db_wherehouse.dart';

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
                    dB.getProducts(Category.bebidas, index);
                    return SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: DraggableProduct(
                        genericProduct: dB.genericProduct,
                        feedback: dB.genericProduct.productWidget,
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
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
