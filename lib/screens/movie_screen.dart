import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(top: 20),
        
            width: MediaQuery.of(context).size.width,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Populer",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(icon: Icon(Icons.search), onPressed: () {})
               
              ],
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
