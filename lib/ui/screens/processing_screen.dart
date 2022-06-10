//Import the Material package
import 'package:dragger/data/db_wherehouse.dart';
import 'package:dragger/ui/screens/directory_section_screen.dart';
import 'package:dragger/ui/screens/order_done_screen.dart';
import 'package:dragger/widgets/processing_one.dart';
import 'package:dragger/widgets/processing_three.dart';
import 'package:dragger/widgets/processing_two.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Create a StatefulWidget called ProcessingScreen
class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({Key? key}) : super(key: key);

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  late PageController pageController;
  late Size size;
  late DbWherehouse dB;
  int pageIndex = 0;
  String elevatedButtonText = 'Continuar';

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    dB = Provider.of<DbWherehouse>(context);
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
            onPressed: () {
              setState(() => dB.getInitialState());
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DirectorySectionScreen(),
                ),
              );
            },
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
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
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
                  Text(pageIndex == 0
                      ? 'R\$${dB.subTotal.toStringAsFixed(2).replaceAll('.', ',')}'
                      : 'R\$${dB.total.toStringAsFixed(2).replaceAll('.', ',')}'),
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
                                  topLeft: Radius.circular(35.0),
                                  topRight: Radius.circular(35.0),
                                ),
                              ),
                              height: size.height * 0.25,
                              child: Column(
                                children: [
                                  const Text(
                                    'Resumo de Valores',
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Total',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                        'R\$${dB.subTotal.toStringAsFixed(2).replaceFirst('.', ',')}'),
                                  ),
                                  ListTile(
                                    title: const Text(
                                      'Taxa de Entrega',
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                    trailing: Text(
                                        'R\$${dB.deliveryFee.toStringAsFixed(2).replaceFirst('.', ',')}'),
                                  ),
                                  dB.subTotal <= 219.99
                                      ? ListTile(
                                          title: const Text(
                                            'Taxa de Serviço',
                                            style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                          trailing: Text(
                                              'R\$${dB.serviceFee.toStringAsFixed(2).replaceFirst('.', ',')}'),
                                        )
                                      : const SizedBox(),
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
                if (pageIndex == 0) {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear);
                  dB.getOrderTotal();
                } else if (pageIndex == 1) {
                  pageController.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.linear);
                  setState(() => elevatedButtonText = 'Finalizar Pedido');
                } else {
                  dB.getPayment();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const OrderDoneScreen(),
                    ),
                  );
                }
              },
              child: Text(
                elevatedButtonText,
                style: const TextStyle(
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
