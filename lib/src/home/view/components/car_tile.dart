import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:black_tech_task_1/src/home/view/components/single_car_tile.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  CarTile(
      {Key? key,
      required this.screenWidth,
      required this.screenHeight,
      required this.cars,
      required this.categoryName})
      : super(key: key);

  final double screenWidth;
  final double screenHeight;
  List<Cars> cars;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          mainAxisExtent: screenHeight * .26),
      itemCount: cars.length,
      itemBuilder: (context, index) => SingleCarTile(
          cars: cars[index], categoryName: categoryName, isFavourite: false),
    );
  }
}
