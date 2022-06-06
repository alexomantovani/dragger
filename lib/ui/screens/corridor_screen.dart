//import the Material package
import 'package:flutter/material.dart';

//create a StatelessWidget called CorridorScreen
class CorridorScreen extends StatelessWidget {
  const CorridorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
//Inside the build() method return a Scaffold() widget without an AppBar() widget.
//Return a Container() widget in it's body property.
//The Container's decorationImage will be the supermarket_corridor.png asset image.
//As the Container's child return a Column() widget with 2 children, the first will be an ElevatedButton() widget
//With a Text() widget as it's child that will display the word "Comprar".
//And the onPressed() function will get the Navigator.push() to the DirectorySectionScreen()
//The last Column's child will be an Icon() widget of Icons.cart