import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notifier/provider_notifier.dart';

class FoodDetails extends StatefulWidget {
  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  final double expanded_height = 400;
  final double rounded_container_height = 50;
  //  foodNotifier.currentFood.imageUrl,

  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);

    return Scaffold(
        body: SafeArea(
      child: CustomScrollView(
        slivers: [
          buildSliverPersistentHeader(foodNotifier),
          SliverToBoxAdapter(
            child: buildMovieDetailsSecound(foodNotifier, context),
          )
        ],
      ),
    ));
  }

  Widget buildSliverPersistentHeader(FoodNotifier foodNotifier) {
    return SliverPersistentHeader(
      delegate: DetailsSliverDelegate(
        expanded_height,
        rounded_container_height,
        foodNotifier,
      ),
    );
  }

  Container buildMovieDetailsSecound(
      FoodNotifier foodNotifier, BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildMovieDetailsfirst(foodNotifier),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                //Descriptions Text for movie
                foodNotifier.currentFood.name,
                style: TextStyle(
                  color: Colors.black45,
                  height: 1.4,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              "Screenshorts",
              style: TextStyle(
                color: Colors.black87,
                height: 1.4,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 164,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                crossAxisCount: 1,
                crossAxisSpacing: 4,
                mainAxisSpacing: 10,
                children: foodNotifier.currentFood.subIngredients
                    .map(
                      (ingredient) => Card(
                        child: Image.network(
                          ingredient,
                          fit: BoxFit.fill,
                          height: 150,
                          width: 250,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Requarment",
                  style: TextStyle(
                    color: Colors.black87,
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.red,
                      height: 1.4,
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            //This the Requerment Class
            // Requerment(),
          ],
        ),
      ),
    );
  }

  Widget buildMovieDetailsfirst(FoodNotifier foodNotifier) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // _buildMovieinfo(populer),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      foodNotifier.currentFood.imageUrl,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          foodNotifier.currentFood.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          foodNotifier.currentFood.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(icon: Icon(Icons.share), onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//First Intro Image Header Class
class DetailsSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedheight;
  final double rounded_container_height;
  final FoodNotifier foodNotifier;

  DetailsSliverDelegate(
    this.expandedheight,
    this.rounded_container_height,
    this.foodNotifier,
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Image.network(
          foodNotifier.currentFood.imageUrl,
          width: MediaQuery.of(context).size.width,
          height: expandedheight,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: expandedheight - rounded_container_height - shrinkOffset,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: rounded_container_height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: expandedheight - 160 - shrinkOffset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                foodNotifier.currentFood.category,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black26,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                foodNotifier.currentFood.category,
                style: TextStyle(
                  color: Colors.white,
                  backgroundColor: Colors.black26,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedheight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
