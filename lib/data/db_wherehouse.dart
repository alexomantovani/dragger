//Import dart Collection package
import 'dart:collection';
//Import Material package if needed.
import 'package:flutter/material.dart';

//Import GenericProduct class
import 'package:dragger/ui/components/generic_product.dart';
//Create enum to differentiate products by category and use them as key to the maps in DbWherehouse

enum Category {
  bebidas,
  padaria,
  higiene,
  limpeza,
  hortifruti,
  carnes,
  laticinios,
  graosEmassas,
}

//Create class DbWherehouse and extend it to the ChangeNotifier for the use of the Provider package
class DbWherehouse extends ChangeNotifier {
  //Inside DbWherehouse create a map that will receive all the data to display and manipulate the products by the user
  //This map will be a Map<String, Map<String, List<dynamic>>> called productDatabase
  //The key to the broader map will be the product categories enums created before the class, the inside map keys will be
  //the imageUrls of the products hardcoded from downloaded assets in the assets/images folder. To finish the variable
  //typing, the values of this map will be a dynamic list composed of a String productId as the first element, a double
  //productPrice as the second element and an int productInventoryCount as the last element of the list.
  final Map<Category, Map<String, List<dynamic>>> productDatabase = {
    Category.bebidas: {
      'lib/assets/images/products/supermarket_12_pack.png': [
        'Brahma Duplo Malte',
        3.19,
        36
      ],
      'lib/assets/images/products/supermarket_longneck.png': [
        'Eisenbahn Longneck',
        4.59,
        60
      ],
      'lib/assets/images/products/supermarket_cocacola.png': [
        'Coca Cola 2l',
        8.49,
        10,
      ],
      'lib/assets/images/products/supermarket_monster.png': [
        'Monster Mango Loco',
        7.49,
        8,
      ],
      'lib/assets/images/products/supermarket_agua_mineral.png': [
        'Água Mineral 1,5l',
        3.79,
        50,
      ],
    },
    Category.carnes: {
      'lib/assets/images/products/supermarket_frango.png': [
        'Frango Inteiro Congelado 3kg',
        34.50,
        12,
      ],
      'lib/assets/images/products/supermarket_peito_de_frango.png': [
        'Peito de frango sem osso 1kg',
        23.80,
        22,
      ],
      'lib/assets/images/products/supermarket_contra_file.png': [
        'Contra Filé 1kg',
        54.50,
        25,
      ],
      'lib/assets/images/products/supermarket_picanha_bovina.png': [
        'Picanha Bovina Argentina 1kg',
        96.97,
        6,
      ],
      'lib/assets/images/products/supermarket_picanha_suina.png': [
        'Picanha Suína 1kg',
        29.97,
        20,
      ],
    },
    Category.graosEmassas: {
      'lib/assets/images/products/supermarket_arroz_tipo1.png': [
        'Arroz Tipo 1 5kg',
        19.90,
        30,
      ],
      'lib/assets/images/products/supermarket_arroz_integral.png': [
        'Arroz integral 1kg',
        7.48,
        10,
      ],
      'lib/assets/images/products/supermarket_macarrao_espaguete.png': [
        'Macarrão Espagute 500g',
        3.98,
        35,
      ],
      'lib/assets/images/products/supermarket_macarrao_talharim.png': [
        'Macarrão Talharim 500g',
        8.95,
        16,
      ],
      'lib/assets/images/products/supermarket_macarrao_instantaneo.png': [
        'Macarrão Instantâneo 70g',
        5.28,
        45,
      ],
    },
    Category.higiene: {
      'lib/assets/images/products/supermarket_desodorante.png': [
        'Desodorante Spray 150ml',
        17.90,
        10,
      ],
      'lib/assets/images/products/supermarket_shampoo.png': [
        'Shampoo 200ml',
        19.48,
        18,
      ],
      'lib/assets/images/products/supermarket_escova_de_dentes.png': [
        'Escova de dentes 3un',
        9.90,
        15,
      ],
      'lib/assets/images/products/supermarket_creme_dental.png': [
        'Creme Dental 90g',
        3.98,
        26,
      ],
      'lib/assets/images/products/supermarket_papel_higienico.png': [
        'Papel Higiênico 30m',
        32.90,
        40,
      ],
    },
    Category.hortifruti: {
      'lib/assets/images/products/supermarket_ovos.png': [
        'Ovos Braco Extra 10un',
        9.80,
        20,
      ],
      'lib/assets/images/products/supermarket_cebola.png': [
        'Cebola Branca 1kg',
        5.98,
        50,
      ],
      'lib/assets/images/products/supermarket_tomate.png': [
        'Tomate 1kg',
        12.80,
        50,
      ],
      'lib/assets/images/products/supermarket_laranja.png': [
        'Laranja Bahia 1kg',
        7.98,
        50,
      ],
      'lib/assets/images/products/supermarket_abobora.png': [
        'Abóbora Moranga 3kg',
        14.94,
        6,
      ],
    },
    Category.laticinios: {
      'lib/assets/images/products/supermarket_leite.png': [
        'Leite Integral 1l',
        5.28,
        50,
      ],
      'lib/assets/images/products/supermarket_yogurt.png': [
        'Iogurte Integral 170g',
        1.99,
        20,
      ],
      'lib/assets/images/products/supermarket_queijo_prato.png': [
        'Queijo Prato 150g',
        7.95,
        25,
      ],
      'lib/assets/images/products/supermarket_queijo_mussarela.png': [
        'Queijo Mussareka 150g',
        7.78,
        35,
      ],
      'lib/assets/images/products/supermarket_cream_cheese.png': [
        'Cream Cheese 300g',
        13.98,
        16,
      ],
    },
    Category.limpeza: {
      'lib/assets/images/products/supermarket_detergente.png': [
        'Detergente 500ml',
        2.70,
        40,
      ],
      'lib/assets/images/products/supermarket_escova.png': [
        'Escova Limpeza',
        4.80,
        4,
      ],
      'lib/assets/images/products/supermarket_balde.png': [
        'Balde Plástico 8l',
        22.90,
        11,
      ],
      'lib/assets/images/products/supermarket_vassoura.png': [
        'Vassoura Multiuso',
        16.98,
        8,
      ],
      'lib/assets/images/products/supermarket_desinfetante.png': [
        'Desinfetante 500ml',
        11.90,
        16,
      ],
    },
    Category.padaria: {
      'lib/assets/images/products/supermarket_pao_frances.png': [
        'Pão Francês 165g',
        2.13,
        200,
      ],
      'lib/assets/images/products/supermarket_pao_de_forma.png': [
        'Pão de Forma 400g',
        5.68,
        10,
      ],
      'lib/assets/images/products/supermarket_pao_italiano.png': [
        'Pão Italiano 1kg',
        22.80,
        7,
      ],
      'lib/assets/images/products/supermarket_donut.png': [
        'Donut Chocolate 250g',
        4.98,
        30,
      ],
      'lib/assets/images/products/supermarket_croissant.png': [
        'Croissant Frango 400g',
        8.94,
        16,
      ],
    },
  };

  //After the creation and definition of the GenericProduct class
  //Create a method that will generate a DraggableProduct on site by receiving a String category.
  //This method will parse all the data needed in the productDatabase map, to send the right
  //product to the right SectionScreen, adding notifyListeners().
  //This method will be called getProducts(String category).
  GenericProduct genericProduct = GenericProduct(
    productId: '',
    productImageUrl: '',
    productPrice: 0.0,
    productInventoryCount: 0,
    productWidget: const SizedBox(),
  );

  void getProducts(Category category, int index) {
    String imageUrl = productDatabase[category]!.keys.elementAt(index);
    String iD = productDatabase[category]!.values.elementAt(index).first;
    double price = productDatabase[category]!.values.elementAt(index)[1];
    int inventoryCount =
        productDatabase[category]!.values.elementAt(index).last;

    genericProduct = GenericProduct(
      productId: iD,
      productImageUrl: imageUrl,
      productPrice: price,
      productInventoryCount: inventoryCount,
      productWidget: Image.asset(imageUrl),
    );
  }

  //Create a private list that will receive the data from the Draggable widget dragged by the user.
  //this list will be called _cartProducts.
  final List<Widget> _cartProducts = [];

  //Create an unmodifiableListView that will get the private list above and send it to the cart where
  //it`ll be displayed after the user draggs it. This unmodifiableListView will be called cartProducts.
  UnmodifiableListView<Widget> get cartProdcuts {
    return UnmodifiableListView(_cartProducts);
  }

  //Create a function that will receive the data from the DraggableProduct and save it in the private list
  //Also this function will trigger another function that calculates the users cartPartials.
  //this function will be called saveCartProducts(GenericProduct genericProduct).
  void saveCartProducts(GenericProduct genericProduct) {
    _cartProducts.add(SizedBox(
      child: genericProduct.productWidget,
    ));
    notifyListeners();
  }

  //Create a private list that will receive the Texts widgets from the getOrderPartial().
  //this list will be called _orderValueSummary.
  final List<Text> _orderValueSummary = [];

  //Create an unmodifiableListView that will get the private list above and send it to the order preview modalBottomSheet where
  //it`ll be displayed after the user presses a button. This unmodifiableListView will be called orderValueSummary.
  UnmodifiableListView<Text> get orderValueSummary {
    return UnmodifiableListView(_orderValueSummary);
  }

  //Create a private list that will receive the String imageUrls from the getOrderPartial().
  //this list will be called _orderImageUrls.
  final List<String> _orderImageUrls = [];

  //Create an unmodifiableListView that will get the private list above and send it to the order preview modalBottomSheet where
  //it`ll be displayed after the user presses a button. This unmodifiableListView will be called orderImageUrls.
  UnmodifiableListView<String> get orderImageUrls {
    return UnmodifiableListView(_orderImageUrls);
  }

  //Create a variable double that will receive the order partial subtotal. This variable will be called subTotal.
  double subTotal = 0.0;

  //Create a variable int that will receive the order total item count. This variable will be called totalQuantity
  int totalQuantity = 0;

  //Create a function that will receive the data from the DraggableProduct and the selected quantity as an integer,
  //and will calculate the order partial without the delivery fee and minimum order fee and save it to the subTotal.
  //using the data it`ll parse the productId, selected quantity and total price to String in a Text widget.
  //this Text widget will be saved in _orderValueSummary.
  //this function will be called getOrderPartial(GenericProduct genericProduct, int selectedQuantity).
  void getOrderPartial(GenericProduct genericProduct, int selectedQuantity) {
    String orderSummary = '';

    totalQuantity == 0
        ? totalQuantity = selectedQuantity
        : totalQuantity += selectedQuantity;

    _orderImageUrls.add(genericProduct.productImageUrl);

    subTotal == 0.0
        ? subTotal = genericProduct.productPrice * selectedQuantity
        : subTotal += genericProduct.productPrice * selectedQuantity;

    orderSummary = genericProduct.productId.contains('_')
        ? '$selectedQuantity x ${genericProduct.productId.replaceFirst('_', ' ')}: R\$${(genericProduct.productPrice * selectedQuantity).toStringAsFixed(2).replaceFirst('.', ',')}'
        : '$selectedQuantity x ${genericProduct.productId}: R\$${(genericProduct.productPrice * selectedQuantity).toStringAsFixed(2).replaceFirst('.', ',')}';
    _orderValueSummary.add(Text(orderSummary));

    notifyListeners();
  }

  //Create a variable double that will receive the order final total. This variavle will be called total.
  double total = 0.0;

  //Create a variable double that will receive the order minimum fee. This variavle will be called serviceFee.
  double serviceFee = 2.99;

  //Create a variable double that will receive the order delivery fee. This variavle will be called deliveryFee.
  double deliveryFee = 11.99;

  //Create a variable String that will receive the orderDayTimeStamp. This variable will be called orderDayTimeStamp.
  late String orderDayTimeStamp;

  //Create a function that get the order partial and checks if the minumum ammount was matched or not, and then
  //adds the delivery fee and if applicable adds the minimum order fee and save it to the total variable. Then this function will get the
  //hour that the user pressed the Make the order button and will parse it into Hour:Minute:Seconds, saving it in the orderDayTimeStamp variable.
  //this function will be called getOrderTotal()
  void getOrderTotal() {
    if (subTotal <= 219.99) {
      total = subTotal + serviceFee + deliveryFee;
      orderDayTimeStamp = DateTime.now().toLocal().toString();
    } else {
      total = subTotal + deliveryFee;
      orderDayTimeStamp = DateTime.now().toLocal().toString();
    }
    notifyListeners();
  }

  //Create a variable bool isPaying that will get its state changed after the user presses the Make the order button
  //from false to true and then to false again, signaling that the payment process is over. This variable will be called isPaying.
  bool isPaying = false;

  //Create a function that will be triggered after the user presses the Make the order button and will change the isPaying state
  //to true, then it`ll wait for 2 seconds to then change isPaying to false again.
  //This function will asyncronous and will be called getPayment().
  void getPayment() async {
    isPaying = !isPaying;
    await Future.delayed(const Duration(seconds: 2));
    isPaying = !isPaying;
    notifyListeners();
  }

  //Create function that will restart the application state by deleting all elements from
  //_cartProducts,_orderImageUrls,_orderValueSummary,subTotal = 0.0, total = 0.0;
  //and then it`ll navigate to the initial screen. This function will be called getInitialState().
  void getInitialState() {
    _cartProducts.clear();
    _orderImageUrls.clear();
    _orderValueSummary.clear();
    subTotal = 0.0;
    total = 0.0;
  }
}
