//Import the Material package
import 'package:flutter/material.dart';
//Import the Provider package
import 'package:provider/provider.dart';

//Import DbWherehouse and DirectorySectionScreen
import '/data/db_wherehouse.dart';
import 'ui/screens/directory_section_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //Create a ChageNotifierProvider outside the MaterialApp and add the
  //DbWherehouse builder for the whole to listen that class

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DbWherehouse(),
      child: const MaterialApp(
        home: DirectorySectionScreen(),
      ),
    );
  }
}
