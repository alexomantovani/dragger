//Import the Material package
import 'package:flutter/material.dart';
//Import the Provider package
import 'package:provider/provider.dart';
//Import DbWherehouse
import 'package:dragger/data/db_wherehouse.dart';

//Create a StatefulWidget called OrderDoneScreen
class OrderDoneScreen extends StatefulWidget {
  const OrderDoneScreen({Key? key}) : super(key: key);

  @override
  State<OrderDoneScreen> createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen> {
  late Size size;
  late DbWherehouse dB;

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
        title: const Text(
          'Detalhes',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor:
                  MaterialStateColor.resolveWith((states) => Colors.white),
            ),
            onPressed: () {},
            child: const Text(
              'Ajuda',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0.0),
            horizontalTitleGap: -size.width * 0.02,
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              width: size.width * 0.25,
              height: size.height * 0.2,
            ),
            title: const Text(
              'Supermercado Interativo',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            subtitle: const Text(
              'Pedido Nº',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              Text(
                'Pedido realizado em:',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20.0,
              ),
              border: Border.all(
                color: Colors.black,
                width: 2.0,
              ),
              image: const DecorationImage(
                image: AssetImage(
                  'lib/assets/images/scene/supermarket_address_map.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            width: size.width * 0.95,
            height: size.height * 0.4,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue.shade100,
            ),
            onPressed: () {
              setState(() => dB.getInitialState());
            },
            child: const Text(
              'Recomeçar',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Inside of it's build() method return a Scaffold() widget with an AppBar()

//The AppBar() will get a title of "Detalhes" and a actions Text() widget
//Displaying "Ajuda"

//The Scaffold's body will return a Column() with 3 children
//The first child will be a ListTile() with a done checkmark Icon and a Text() widget
//Displaying "Pedido finalizado em: horário"
//The second child will be an Image.asset() widget with the delivery address image 
//The last child will be an ElevatedButton() widget "Recomeçar" that triggers the 
//function getInitialState() in the DbWherehouse class
