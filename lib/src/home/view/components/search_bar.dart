import 'package:black_tech_task_1/src/home/controller/home_search_controller.dart';
import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
    required this.carsList,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;
  List<Cars> carsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        showSearch(
            context: context,
            delegate: HomeSearchController(carsSearchList: carsList));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth / 25),
        height: screenHeight / 22,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 20,
            ),
            SizedBox(
              width: 5,
            ),
            Text("Search")
          ],
        ),
      ),
    ));
  }
}
