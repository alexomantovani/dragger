//Import the Material package
import 'package:flutter/material.dart';

//Import the Provider package
import 'package:provider/provider.dart';

import '/data/db_wherehouse.dart';

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
    final DbWherehouse dB = Provider.of<DbWherehouse>(context);
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: size.width * 0.05,
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
          Divider(
            color: Colors.grey.shade500,
            thickness: 1.4,
            endIndent: 20.0,
            indent: 20.0,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dB.orderValueSummary.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.only(left: size.width * 0.08),
                minVerticalPadding: size.height * 0.01,
                title: dB.orderValueSummary[index],
                trailing: SizedBox(
                  height: size.height * 0.08,
                  width: size.width * 0.12,
                  child: Image.asset(
                    dB.orderImageUrls[index],
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
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
