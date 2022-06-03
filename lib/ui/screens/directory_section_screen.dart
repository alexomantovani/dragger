import 'package:flutter/material.dart';

import 'package:dragger/data/db_wherehouse.dart';

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
          image: DecorationImage(
            image: AssetImage('lib/assets/images/supermarket_corridor.jpg'),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;

            return Stack(
              children: [
                Transform.translate(
                  offset: Offset(width / 2, 0.0),
                  child: Container(
                    width: width * 0.007,
                    height: height * 0.805,
                    color: Colors.black,
                  ),
                ),
                Transform.translate(
                  offset: Offset(width / 2.65, height / 6.7),
                  child: SizedBox(
                    height: height * 0.75,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: width / 4,
                          height: height * 0.003,
                          color: Colors.black,
                        ),
                        Container(
                          width: width / 4,
                          height: height * 0.003,
                          color: Colors.black,
                        ),
                        Container(
                          width: width / 4,
                          height: height * 0.003,
                          color: Colors.black,
                        ),
                        Container(
                          width: width / 4,
                          height: height * 0.003,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(width / 19, height / 6.7),
                  child: SizedBox(
                    height: height * 0.75,
                    width: width * 0.9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.bebidas.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.carnes.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.graosEmassas.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.higiene.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.hortifruti.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.laticinios.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.limpeza.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: width * 0.25,
                              height: height * 0.12,
                              color: Colors.blue,
                              alignment: Alignment.center,
                              child: Text(
                                Category.padaria.name.characters
                                    .toUpperCase()
                                    .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
