import 'package:black_tech_task_1/constants.dart';
import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:flutter/material.dart';

class SingleCategoryTile extends StatelessWidget {
  const SingleCategoryTile({
    Key? key,
    required this.categories,
    required this.screenWidth,
    required this.isSelected,
  }) : super(key: key);

  final Categories categories;
  final bool isSelected;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 10,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? primaryColor : Colors.white,
          border: Border.all(width: 1.5, color: primaryColor)),
      child: Center(
          child: Text(
        categories.title ?? '',
        style: TextStyle(color: isSelected ? Colors.white : primaryColor),
      )),
    );
  }
}
