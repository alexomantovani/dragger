import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/db_wherehouse.dart';

class AisleSectionScreen extends StatelessWidget {
  const AisleSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dB = Provider.of<DbWherehouse>(context);
    final Category arguments =
        ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    dB.getProducts(arguments, index);
                    return dB.genericProduct.productWidget;
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
