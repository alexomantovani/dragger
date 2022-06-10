// ignore_for_file: use_build_context_synchronously
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/data/db_wherehouse.dart';
import '/widgets/draggable_product.dart';
import '/widgets/dragg_target.dart';
import '/ui/screens/processing_screen.dart';
import '/ui/screens/directory_section_screen.dart';

class AisleSectionScreen extends StatefulWidget {
  const AisleSectionScreen({Key? key}) : super(key: key);

  @override
  State<AisleSectionScreen> createState() => _AisleSectionScreenState();
}

class _AisleSectionScreenState extends State<AisleSectionScreen> {
  late DbWherehouse dB;
  late Size size;
  late SnackBar snackBar;
  bool isDeleting = false;

  @override
  void initState() {
    showSnackBar();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    dB = Provider.of<DbWherehouse>(context);
    size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  //Create callback function to the SnackBar
  void showSnackBar() async {
    snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.up,
      margin: const EdgeInsets.symmetric(
        vertical: 352.0,
        horizontal: 52.0,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.lightBlue.shade100,
      content: const Text(
        'Arraste os produtos até o carrinho',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
    await Future.delayed(const Duration(seconds: 1));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Category;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showCupertinoDialog<String>(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: const Text(
                    'Deseja manter seus itens no carrinho?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () {
                        setState(() => dB.getInitialState());
                        Navigator.popAndPushNamed(
                            context, DirectorySectionScreen.routeName);
                      },
                      child: const Icon(
                        Icons.thumb_down_alt,
                        color: Colors.black,
                      ),
                    ),
                    CupertinoDialogAction(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, DirectorySectionScreen.routeName);
                      },
                      child: const Icon(
                        Icons.thumb_up_alt,
                        color: Colors.black,
                        size: 20.0,
                      ),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          Stack(
            children: [
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
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                          height: size.height * 0.4,
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.03),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Expanded(
                                child: Text(
                                  'Resumo de Valores',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.5),
                                      width: 1.5,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      20.0,
                                    ),
                                  ),
                                  width: size.width * 0.9,
                                  child: ListView.builder(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.04),
                                    itemCount: dB.orderValueSummary.length,
                                    itemBuilder: (context, index) => ListTile(
                                      contentPadding: EdgeInsets.only(
                                          top: size.height * 0.01),
                                      minVerticalPadding: size.height * 0.01,
                                      leading: SizedBox(
                                        width: size.width * 0.12,
                                        height: size.height * 0.08,
                                        child: Image.asset(
                                          dB.orderImageUrls[index],
                                          alignment: Alignment.center,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      title: dB.orderValueSummary[index],
                                      trailing: IconButton(
                                        onPressed: () {
                                          showCupertinoDialog(
                                              context: context,
                                              builder: (context) {
                                                return CupertinoAlertDialog(
                                                  content: const Text(
                                                    'Deletar produto?',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                  actions: [
                                                    CupertinoDialogAction(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              context),
                                                      child: const Text(
                                                        'Não',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                    CupertinoDialogAction(
                                                      onPressed: () async {
                                                        setState(() {
                                                          dB.deleteSingleItem(
                                                              index);
                                                          isDeleting = true;
                                                        });
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                        await Future.delayed(
                                                            const Duration(
                                                                seconds: 1));
                                                        setState(() =>
                                                            isDeleting = false);
                                                      },
                                                      child: const Text(
                                                        'Sim',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              });
                                        },
                                        icon: Icon(
                                          Icons.delete_outline,
                                          color: Colors.red.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              Text(
                                'Subtotal: R\$${dB.subTotal.toStringAsFixed(2).replaceFirst('.', ',')}',
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProcessingScreen(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightBlue.shade100,
                                ),
                                child: const Text(
                                  'Finalizar',
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
                    },
                  );
                },
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                  size: 35.0,
                ),
              ),
              Container(
                transform: Matrix4.identity()
                  ..translate(size.width * 0.06, -size.height * 0.015),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                width: dB.totalQuantity.toString().length > 1
                    ? size.width * 0.05
                    : size.width * 0.04,
                child: Text(
                  '${dB.totalQuantity}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: isDeleting == true
          ? const Center(
              child: CupertinoActivityIndicator(radius: 10.0),
            )
          : LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          dB.getProducts(arguments, index);
                          List<Widget> draggables = List<Widget>.generate(
                            5,
                            (index) => Expanded(
                              child: SizedBox(
                                width: 75.0,
                                height: 75.0,
                                child: DraggableProduct(
                                  genericProduct: dB.genericProduct,
                                  feedback: SizedBox(
                                      width: 150.0,
                                      height: 200.0,
                                      child: dB.genericProduct.productWidget),
                                  childWhenDragging: ShaderMask(
                                    child: dB.genericProduct.productWidget,
                                    shaderCallback: (Rect bounds) {
                                      return LinearGradient(
                                        colors: [
                                          Colors.grey.shade900,
                                          Colors.black,
                                        ],
                                      ).createShader(bounds);
                                    },
                                  ),
                                  child: dB.genericProduct.productWidget,
                                ),
                              ),
                            ),
                          );
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: draggables,
                          );
                        },
                      ),
                    ),
                    const DraggTarget()
                  ],
                );
              },
            ),
    );
  }
}

//Update the AisleSectionScreen to receive the Shelves, FloorTiles ans WallTiles widgets
//And form the layout appealing of a real supermarket ailse with shelves

//The Column() needs to go and give the place to a Stack() widget
//The new widgets and components will need if and case statements to be positioned
//Add an AppBar() to the screen with two buttons, an arrow back to return to the DirectorySectionScreen
//And an supermarket_cart icon to go to the orderSummary 
//Add a warning sign at the top of the shelve to let the user know what needs to be done with the products.
