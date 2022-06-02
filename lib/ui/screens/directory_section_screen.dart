import 'package:flutter/material.dart';

class DirectorySectionScreen extends StatelessWidget {
  const DirectorySectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //In the Scafold's body create a Container that will get the whole screen size and an image in the background.
    //As the Containers's child, create a Stack.
    //the Stack will have 2 children, the one on top will be the Column that will contain 8 squares
    //100x100 in proportion with the device screen size. In the squares's child will contain 8 Text widget with the section's names(Categories DbWherehouse).
    //The child above will be 5 ClipPath widgets that will form the Directory Sign Structure,
    //4 horizontal and 1 vertical ClipPath widgets of 2px thick in proportion with the device screen size.

    //Each square will be in a GestureDetector to trigger an onTap function and navigate to the respective aisle product section

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage(''),
            // ),
            ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Stack(
              children: const [],
            );
          },
        ),
      ),
    );
  }
}
