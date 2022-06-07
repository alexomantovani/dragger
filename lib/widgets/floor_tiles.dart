//Import the Material package
import 'dart:math';

import 'package:flutter/material.dart';

//Create a StatelessWidget called WallTiles()
class FloorTiles extends StatelessWidget {
  const FloorTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Create a final Size size variable to get the device size from the MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;
    //Inside of it's build() method return a Scaffold() without an AppBar()
    //The Scaffold's body gets a Column()
    //The Column() will receive a generated number of Row() and Column() widgets
    //These Row() and Column() widgets will receive a generated number of Container() widgets
    //These Container() widgets will be the lines when put in perspective by the Transform() widget
    //Will finally form a Floor Tile

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            transform: Matrix4.identity()..translate(0.0, size.height * 0.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(pi / 12),
                  height: size.height * 0.3,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(pi / 24),
                  height: size.height * 0.3,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(pi / 72),
                  height: size.height * 0.3,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(-pi / 72),
                  height: size.height * 0.3,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(-pi / 24),
                  height: size.height * 0.30,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
                Container(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..rotateZ(-pi / 12),
                  height: size.height * 0.3,
                  width: size.width * 0.005,
                  color: Colors.black,
                ),
              ],
            ),
          ),
          Container(
            transform: Matrix4.identity()..translate(0.0, -size.height * 0.05),
            width: size.width,
            height: size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: size.height * 0.002,
                  width: size.width,
                  color: Colors.black,
                ),
                Container(
                  height: size.height * 0.002,
                  width: size.width,
                  color: Colors.black,
                ),
                Container(
                  height: size.height * 0.002,
                  width: size.width,
                  color: Colors.black,
                ),
                Container(
                  height: size.height * 0.002,
                  width: size.width,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
