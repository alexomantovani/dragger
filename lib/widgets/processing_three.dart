//Import the Material package
import 'package:dragger/data/db_wherehouse.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Create a StatelessWidget called ProcessingThree
class ProcessinThree extends StatelessWidget {
  const ProcessinThree({Key? key}) : super(key: key);

  //Inside it's build() method return a Column() with 3 children

  //The first child will be a Expanded() widget with a ListView as a child that will return
  //Several ListTile() widgets with the orderSummary

  //The second child will be a Text() widget "Pagamento" followed bellow by the third child, the ListTile() widget
  //displaying the credit card company and card information.

  @override
  Widget build(BuildContext context) {
    final DbWherehouse dB = Provider.of<DbWherehouse>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        ListTile(
          title: const Text(
            'Total',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
          trailing:
              Text('R\$${dB.total.toStringAsFixed(2).replaceFirst('.', ',')}'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Pagamento:',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
        ListTile(
          leading:
              Image.asset('lib/assets/images/scene/supermarket_visa_icon.png'),
          title: const Text('Crédito'),
          subtitle: Text(
            'Visa ***** 1234',
            style: TextStyle(
              color: Colors.grey.shade500,
            ),
          ),
          trailing: const Text('Trocar'),
        ),
      ],
    );
  }
}
