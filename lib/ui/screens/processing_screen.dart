//Import the Material package
import 'package:dragger/widgets/processing_one.dart';
import 'package:dragger/widgets/processing_three.dart';
import 'package:dragger/widgets/processing_two.dart';
import 'package:flutter/material.dart';

//Create a StatefulWidget called ProcessingScreen
class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  late PageController pageController;
  late Size size;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Carrinho',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Limpar',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: PageView(
        controller: pageController,
        children: const [
          ProcessingOne(),
          ProcessingTwo(),
          ProcessinThree(),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: size.height * 0.14,
        width: size.width,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ListTile(
              leading: const Text(
                'Valor Total',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              trailing: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Text('R\$Valor'),
                  IconButton(
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
                                    'Resumo de Valores',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down,
                    ),
                  )
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue.shade100,
                minimumSize: Size(
                  size.width * 0.92,
                  size.height * 0.05,
                ),
              ),
              onPressed: () {
                pageController.animateToPage(
                  2,
                  duration: const Duration(
                    seconds: 1,
                  ),
                  curve: Curves.elasticInOut,
                );
              },
              child: const Text(
                'Continuar',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//Inside of the build() method return a Scaffold() with an AppBar()
//The AppBar() receives an arrow_back to pop back to the previous screen,
//a title "Carrinho" and a TextButton() to clean the shopping_cart called "Limpar".

//The Scaffold's body will return a PageView() widget with 3 different pages
//All 3 pages will cover the processing steps of ordering the users groceries
//The steps will be order preview before shipping, delivery or takeout summary and
//order preview after shipping.

//The Scaffold's bothomsheet property will get a CustomBottomSheet() widget,
//that ruturns a ListTile() displaying the order total and a IconButton that will trigger
//a ModalBottomSheet with order costs details. Right bellow the ListTile() widget,
//an ElevatedButton() widget to chage the PageView() pages using the pageViewController,
//keeping this function and "Continuar" name until the procesing screen 3, where it'll
//change it's name to "Fazer Pedido"  and will trigger the makeOrder() function,
//this function triggers the calculus function, dateTime() function and navigates to the
//OrderDoneScreen()
