//Import the Material package
import 'package:flutter/material.dart';

//Create a StatelessWidget called ProcessingTwo
class ProcessingTwo extends StatefulWidget {
  const ProcessingTwo({Key? key}) : super(key: key);

  @override
  State<ProcessingTwo> createState() => _ProcessingTwoState();
}

class _ProcessingTwoState extends State<ProcessingTwo> {
  bool isPressedOne = false;
  bool isPressedTwo = false;
  bool isPressedThree = true;
  bool isPressedFour = false;
  bool isPressedFive = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width * 0.02,
              ),
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
              Column(
                children: [
                  TextButton(
                    onPressed: () =>
                        setState(() => isPressedOne = !isPressedOne),
                    child: Text(
                      'Entrega',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isPressedOne == false
                            ? Colors.lightBlue
                            : Colors.black,
                        fontWeight: isPressedOne == false
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isPressedOne == false ? true : false,
                    child: Container(
                      color: Colors.lightBlue,
                      width: size.width * 0.16,
                      height: size.height * 0.002,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() => isPressedOne = !isPressedOne);
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
                    child: Text(
                      'Retirada',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: isPressedOne == false
                            ? Colors.black
                            : Colors.lightBlue,
                        fontWeight: isPressedOne == false
                            ? FontWeight.normal
                            : FontWeight.w600,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isPressedOne == false ? false : true,
                    child: Container(
                      color: Colors.lightBlue,
                      width: size.width * 0.16,
                      height: size.height * 0.002,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.008,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.02,
            ),
            child: const Text(
              'Onde deixar?',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.06,
            child: ListView(
              itemExtent: size.width * 0.6,
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    isPressedTwo = !isPressedTwo;
                    isPressedThree = false;
                    isPressedFour = false;
                  }),
                  child: Chip(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: isPressedTwo == false
                          ? BorderSide(
                              color: Colors.grey.shade200,
                            )
                          : const BorderSide(
                              color: Colors.lightBlue,
                            ),
                    ),
                    label: const Text(
                      'Portaria da casa/prédio',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isPressedThree = !isPressedThree;
                    isPressedTwo = false;
                    isPressedFour = false;
                  }),
                  child: Chip(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: isPressedThree == true
                            ? const BorderSide(
                                color: Colors.lightBlue,
                              )
                            : BorderSide(
                                color: Colors.grey.shade200,
                              )),
                    label: const Text(
                      'Portaria do prédio/condomínio',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() {
                    isPressedFour = !isPressedFour;
                    isPressedThree = false;
                    isPressedTwo = false;
                  }),
                  child: Chip(
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: isPressedFour == false
                          ? BorderSide(
                              color: Colors.grey.shade200,
                            )
                          : const BorderSide(
                              color: Colors.lightBlue,
                            ),
                    ),
                    label: const Text(
                      'Encontrar com o entregador',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.02,
            ),
            child: const Text(
              'Hoje, 25 - 30min',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          SizedBox(
            height: size.height * 0.08,
            child: ListView(
              scrollDirection: Axis.horizontal,
              itemExtent: size.width * 0.4,
              children: [
                GestureDetector(
                  onTap: () => setState(() => isPressedFive = false),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: isPressedFive == false
                            ? Colors.lightBlue
                            : Colors.blueGrey.shade100,
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
                            children: [
                              Expanded(
                                child: Text(
                                  'Padrão',
                                  style: TextStyle(
                                    color: isPressedFive == false
                                        ? Colors.lightBlue
                                        : Colors.black,
                                    fontWeight: isPressedFive == false
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'Hoje, 25 - 30min',
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'R\$6,99',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blueGrey.shade100,
                                  width: 1.0,
                                )),
                            child: Icon(
                              Icons.question_mark_rounded,
                              color: Colors.blueGrey.shade100,
                              size: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => setState(() => isPressedFive = true),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: BorderSide(
                        color: isPressedFive == true
                            ? Colors.lightBlue
                            : Colors.blueGrey.shade100,
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
                            children: [
                              Expanded(
                                child: Text(
                                  'Entrega agendada',
                                  style: TextStyle(
                                    color: isPressedFive == true
                                        ? Colors.lightBlue
                                        : Colors.black,
                                    fontWeight: isPressedFive == true
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'Hoje, 25 - 30min',
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'R\$6,99',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.blueGrey.shade100,
                                  width: 1.0,
                                )),
                            child: Icon(
                              Icons.question_mark_rounded,
                              color: Colors.blueGrey.shade100,
                              size: 15.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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

