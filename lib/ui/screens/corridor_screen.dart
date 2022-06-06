//import the Material package
import 'package:dragger/ui/screens/directory_section_screen.dart';
import 'package:flutter/material.dart';

//create a StatelessWidget called CorridorScreen
class CorridorScreen extends StatelessWidget {
  const CorridorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('lib/assets/images/scene/supermarket_corridor.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent.withOpacity(0.4),
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DirectorySectionScreen(),
                  ),
                );
              },
              child: const Text(
                'Comprar',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
            Icon(
              Icons.shopping_cart,
              size: 80.0,
              color: Colors.lightBlueAccent.withOpacity(0.6),
            ),
            const SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}
//Inside the build() method return a Scaffold() widget without an AppBar() widget.
//Return a Container() widget in it's body property.
//The Container's decorationImage will be the supermarket_corridor.png asset image.
//As the Container's child return a Column() widget with 2 children, the first will be an ElevatedButton() widget
//With a Text() widget as it's child that will display the word "Comprar".
//And the onPressed() function will get the Navigator.push() to the DirectorySectionScreen()
//The last Column's child will be an Icon() widget of Icons.cart