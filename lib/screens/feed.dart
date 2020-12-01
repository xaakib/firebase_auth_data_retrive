import 'package:firebase_auth_data_retrive/api/food_api.dart';
import 'package:firebase_auth_data_retrive/notifier/auth_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/food_notifier.dart';
import 'package:firebase_auth_data_retrive/notifier/orange_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    OrangeNotifier orangeNotifier =
        Provider.of<OrangeNotifier>(context, listen: false);
    getOranges(orangeNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier =
        Provider.of<AuthNotifier>(context, listen: false);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);
    OrangeNotifier orangeNotifier = Provider.of<OrangeNotifier>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 5,
            expandedHeight: 200,
            // flexibleSpace: Image.asset(
            //   "assets/images/name.png",
            //   fit: BoxFit.cover,
            // ),
            actions: [
              Container(
                height: 80,
                width: 80,
                child: Text(authNotifier.user != null
                    ? authNotifier.user.displayName
                    : "Unknown"),
              ),
              IconButton(
                  icon: Icon(
                    Icons.people,
                    size: 28,
                    color: Colors.white,
                  ),
                  onPressed: () {}),
            ],
            floating: true,
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            title: Text(
              "Movie Server",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: opulerContainerRow(foodNotifier),
          ),
          SliverPadding(padding: EdgeInsets.only(top: 20)),
          SliverToBoxAdapter(
            child: orangeContainerRow(orangeNotifier),
          ),
        ],
      ),
    );
  }

  Widget orangeContainerRow(OrangeNotifier orangeNotifier) {
    return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Orange",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 250,
                      color: Colors.red,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: orangeNotifier.orangeList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => DetailScreen(populer[index])));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Card(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 180,
                                      width: 135,
                                      child: Image.network(
                                        orangeNotifier
                                            .orangeList[index].imageUrl
                                            .toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orangeNotifier
                                                .orangeList[index].category
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text((orangeNotifier
                                              .orangeList[index].name
                                              .toString())),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              
         
          
  }

  Widget opulerContainerRow(
      FoodNotifier foodNotifier, ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            "Food",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250,
          color: Colors.red,
          child: ListView.builder(
               itemCount: foodNotifier.foodList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => DetailScreen(populer[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: 135,
                          child: Image.network(
                            foodNotifier.foodList[index].imageUrl.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                foodNotifier.foodList[index].category
                                    .toString(),
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text((foodNotifier.foodList[index].name
                                  .toString())),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
         
          ),
        ),
      ],
    );
  }
}
