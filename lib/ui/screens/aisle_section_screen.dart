import 'package:flutter/material.dart';

class AisleSectionScreen extends StatelessWidget {
  const AisleSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column();
        },
      ),
    );
  }
}
