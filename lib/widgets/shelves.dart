//Import the Material package
import 'package:flutter/material.dart';

//Create a StatelessWidget called Shelves
class Shelves extends StatelessWidget {
  const Shelves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Create a final Size size variable to get the device size from the MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..translate(size.width * 0.3, size.height * 0.2, size.height / 5),
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
        ),
        height: size.height * 0.6,
        width: size.width * 0.6,
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.6,
                  width: size.width * 0.02,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.6,
                  width: size.width * 0.02,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                      CircleAvatar(
                        radius: size.width * 0.005,
                        backgroundColor: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              transform: Matrix4.identity()
                ..translate(0.0, -size.height * 0.636),
              height: size.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    transform: Matrix4.identity()
                      ..translate(0.0, size.height * 0.06),
                    height: size.height * 0.015,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.identity()
                      ..translate(0.0, size.height * 0.03),
                    height: size.height * 0.015,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.identity()
                      ..translate(0.0, size.height * 0.02),
                    height: size.height * 0.015,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  Container(
                    transform: Matrix4.identity()
                      ..translate(0.0, size.height * 0.01),
                    height: size.height * 0.015,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * 0.015,
                    width: size.width * 0.6,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade500,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
//inside the build() method return a Scaffold() without an AppBar()
//The Scaffold() will get a Container() in it's body
//The Container() will be the backdrop part of the shelve and will get a Column() as a child
//The Column() will receive 10 children
//The children will be 5 horizontal Container() widgets in perspective with the use of the Transform()
//The other children will be 5 vertical Container() widgets in perspective with the use of the Transform()
