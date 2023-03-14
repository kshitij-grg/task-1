import 'package:black_tech_task_1/constants.dart';
import 'package:black_tech_task_1/src/favourites/controller/favourite_controller.dart';
import 'package:black_tech_task_1/src/favourites/view/favourite_view.dart';
import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:black_tech_task_1/src/home/view/components/category_bar.dart';
import 'package:black_tech_task_1/src/home/view/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double screenHeight = 0;
  double screenWidth = 0;

//populating with some dummy data
  List<Categories> categoriesList = [
    Categories(
      title: 'SUV',
      cars: [
        Cars(
            name: 'Santro',
            detail: 'Details',
            dateAdded: '2021-05-25',
            image: 'assets/images/santro.png'),
        Cars(
            name: 'Avatior',
            detail: 'Details',
            dateAdded: '2020-01-21',
            image: 'assets/images/aviator.png'),
        Cars(
            name: 'Scorpio',
            detail: 'Details',
            dateAdded: '2020-08-19',
            image: 'assets/images/scorpio.png'),
      ],
    ),
    Categories(title: 'Hatchback', cars: [
      Cars(
          name: 'Magna',
          detail: 'Details',
          dateAdded: '2021-05-25',
          image: 'assets/images/magna.png'),
    ]),
    Categories(
      title: 'Crossover',
    ),
    Categories(
      title: 'Convertible',
    ),
    Categories(
      title: 'Sedan',
    ),
  ];

  List<Cars> getCarsOnly() {
    List<Cars> tempCarsList = [];
    for (int i = 0; i < categoriesList.length; i++) {
      for (Cars car in categoriesList[i].cars ?? []) {
        tempCarsList.add(car);
      }
    }
    return tempCarsList;
  }

  final favouriteController = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: false,
        leadingWidth: 30,
        title: Row(
          children: [
            SearchBar(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                carsList: getCarsOnly()),
            SizedBox(
              width: screenWidth / 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(() => FavouriteView());
                },
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: screenWidth / 20),
            child: GestureDetector(
              onTap: () {
                // Get.to(() => SortedCarView(categoriesList: categoriesList));
              },
              child: const Icon(
                Icons.filter_alt_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: primaryColor,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('Item 1'),
            ),
            ListTile(
              title: Text('Item 2'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20, vertical: screenHeight / 40),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Categories",
              style: TextStyle(
                  color: primaryColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight / 90,
            ),
            Expanded(
              child: CategoryBar(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  categoriesList: categoriesList,
                  carsList: getCarsOnly()),
            ),
          ],
        ),
      ),
    );
  }
}
