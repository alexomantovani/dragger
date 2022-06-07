//Import the Material package
import 'package:flutter/material.dart';

//Create a StatelessWidget called ProcessingTwo
class ProcessingTwo extends StatelessWidget {
  const ProcessingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Entrega',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF757575),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(65.0),
                              topRight: Radius.circular(65.0),
                            ),
                          ),
                          height: size.height * 0.15,
                          child: Column(
                            children: const [
                              Text(
                                'Endereço',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: const Text(
                'Retirada',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        const Text(
          'Onde deixar?',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => const Chip(
              label: Text(
                'Portaria do Condomínio',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        const Text(
          'Hoje, 25 - 30min',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.02),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: const Text(
                'Padrão',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: size.height * 0.6,
        ),
      ],
    );
  }
}
//Inside it's build() method return a Column() with 5 children

//The first child will be a Row() widget with two other widgets
//A Text() widget to display "Entrega" and a TextButton() to display "Retirada",
//The TextButton() will trigger a ModalBottomSheet that displays the store address information

//The second child will be a Text() widget "Onder deixar?" followed bellow by the third child, the ListView() widget
//displaying chips with the possible places to choose.

//The fourth child will be a Text() widget "Hoje, tempo para entrega" followed bellow by the fifth child, the ListView() widget
//displaying chips with the possible places to choose.

