//Import the Material package
import 'package:flutter/material.dart';

//Create a StatelessWidget called WallTiles()
class WallTiles extends StatelessWidget {
  const WallTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Create a final Size size variable to get the device size from the MediaQuery.of(context).size;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(top: 0.0),
        physics: const ScrollPhysics(parent: NeverScrollableScrollPhysics()),
        children: [
          Column(
            children: [
              SizedBox(
                height: size.height * 0.65,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.0015,
                      width: size.width,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.65,
                transform: Matrix4.identity()
                  ..translate(0.0, -size.height * 0.65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                    Container(
                      height: size.height * 0.65,
                      width: size.width * 0.004,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//Inside of it's build() method return a Scaffold() without an AppBar()
//The Scaffold's body gets a Column()
//The Column() will receive a generated number of Row() and Column() widgets
//These Row() and Column() widgets will receive a generated number of Container() widgets
//These Container() widgets will be the lines when put in perspective by the Transform() widget
//Will finally form a Wall Tile