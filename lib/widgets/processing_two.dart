//Import the Material package
import 'package:flutter/material.dart';

//Create a StatelessWidget called ProcessingTwo
class ProcessingTwo extends StatelessWidget {
  const ProcessingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade100,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                width: size.width * 0.15,
                height: size.height * 0.1,
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'lib/assets/images/scene/supermarket_delivery.png',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                width: size.width * 0.05,
              ),
              const Text(
                'Supermercado Interativo',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
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
          SizedBox(
            height: size.height * 0.06,
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
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.08,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemExtent: size.width * 0.4,
              itemCount: 7,
              itemBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  side: BorderSide(
                    color: Colors.blueGrey.shade200,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(
                            child: Text(
                              'Padrão',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Hoje, 25 - 30min',
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'R\$6,99',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.blueGrey.shade200,
                              width: 1.0,
                            )),
                        child: Icon(
                          Icons.question_mark_rounded,
                          color: Colors.blueGrey.shade200,
                          size: 15.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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

