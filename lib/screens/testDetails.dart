import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/provider_notifier.dart';

class TestDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrangeNotifier orangeNotifier =
        Provider.of<OrangeNotifier>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(orangeNotifier.currentOrange.name),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Image.network(
                orangeNotifier.currentOrange.imageUrl,
                height: 300,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                orangeNotifier.currentOrange.name,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              Text(
                orangeNotifier.currentOrange.category,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              // GridView.count(
              //   scrollDirection: Axis.vertical,
              //   shrinkWrap: true,
              //   crossAxisCount: 3,
              //   crossAxisSpacing: 4,
              //   mainAxisSpacing: 4,
              //   children: orangeNotifier.currentOrange.subIngredients
              //       .map(
              //         (ingredient) => Card(
              //           color: Colors.redAccent,
              //           child: Center(
              //             child: Text(
              //               ingredient,
              //               style: TextStyle(
              //                 fontSize: 20,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //       .toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
