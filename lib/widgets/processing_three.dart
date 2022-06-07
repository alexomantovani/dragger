//Import the Material package
import 'package:flutter/material.dart';

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
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return const SizedBox();
            },
          ),
        ),
        const Text(
          'Pagamento:',
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.lightBlue.shade100,
            radius: size.width * 0.2,
          ),
          title: Text(
            '1234',
            style: TextStyle(color: Colors.grey.shade200),
          ),
          trailing: const Card(
            child: Text('Visa'),
          ),
        )
      ],
    );
  }
}
