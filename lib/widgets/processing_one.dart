//Import the Material package
import 'package:flutter/material.dart';

//create a StatelessWidget called ProcessingOne
class ProcessingOne extends StatelessWidget {
  const ProcessingOne({Key? key}) : super(key: key);
  //Inside it's build() method return a Column() with 2 children

  //The first child will be a ListTile() widget with two other widgets
  //A CircleAvatar() widget to display the store logo and a Text() widget in the title
  //To display the store name

  //The second child will be a Expanded() widget with a ListView as a child that will return
  //Several ListTile() widgets with the orderSummary
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: size.width * 0.1,
            backgroundColor: Colors.lightBlue.shade100,
          ),
          title: const Text(
            'Supermercado Interativo',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              contentPadding: EdgeInsets.only(left: size.width * 0.08),
              minVerticalPadding: size.height * 0.01,
              title: const Text(
                'Monster Mango Loco 3x R\$29,70',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
              trailing: CircleAvatar(
                radius: size.width * 0.2,
                backgroundColor: Colors.lightBlue.shade100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
