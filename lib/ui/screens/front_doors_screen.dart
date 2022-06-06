//Import the Material package
// ignore_for_file: use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';

import 'corridor_screen.dart';

//Create a StatefulWidget called FrontDoorsScreen
class FrontDoorsScreen extends StatefulWidget {
  const FrontDoorsScreen({Key? key}) : super(key: key);

  @override
  State<FrontDoorsScreen> createState() => _FrontDoorsScreenState();
}

class _FrontDoorsScreenState extends State<FrontDoorsScreen>
    with SingleTickerProviderStateMixin {
  //Insite the FrontDoorsScreen State, create an Animation<double> and AnimationController
  //They will set the Y axis rotation to create the open doors animation.
  //Both variables will be declared as late and will be initialized in the initState() method.
  late Animation<double> animation;
  late AnimationController animationController;

  //Call initState() method
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    animation = Tween<double>(begin: 0.0, end: pi / 4).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInBack),
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  //Create the openTheDoors() function that will trigger animationController!.foward() method.
  void openTheDoors() {
    animationController.forward();
  }

  //Create a late variable of Size type and initialize it in the didChangeDependecies() method
  //with MediaQuery(context).size
  late Size size;

  //Call the didChangeDependencies() method
  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //Iniside the build() method return a Scaffold() with no AppBar().
    return Scaffold(
      //In the body property return a Column()
      body: Column(
        //Return a Row with 2 Container() as children
        //In both Container() return a Column as it's child, wit 3 children. One will be the Door Handle and the others
        //will be the rotation support.
        children: [
          Expanded(
            flex: 10,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..translate(0.0, 0.0, 300.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      transformAlignment: Alignment.bottomLeft,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0005)
                        ..rotateY(-animation.value),
                      height: size.height * 0.5,
                      width: size.width * 0.69,
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.2),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      transformAlignment: Alignment.bottomRight,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.0005)
                        ..rotateY(animation.value),
                      height: size.height * 0.5,
                      width: size.width * 0.69,
                      child: Column(
                        children: const [],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //At the bottom almost like a bottomsheet create an ElevatedButton with a Text as it's child, to diplay the word
          //'Abrir'at the center.
          //On the onPressed() will get the openTheDoors() function.
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.blue.withOpacity(0.2),
              elevation: 0.0,
              side: BorderSide(
                color: Colors.black.withOpacity(0.2),
                width: 1.5,
                style: BorderStyle.solid,
              ),
            ),
            onPressed: () async {
              openTheDoors();
              await Future.delayed(const Duration(milliseconds: 2500));
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CorridorScreen(),
                ),
              );
            },
            child: const Text(
              'Abrir',
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(height: size.height * 0.06)
        ],
      ),
    );
  }
}
