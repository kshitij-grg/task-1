import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:black_tech_task_1/src/home/view/components/car_tile.dart';
import 'package:black_tech_task_1/src/home/view/components/single_category_tile.dart';
import 'package:black_tech_task_1/src/sorted_car/sorted_car_view.dart';
import 'package:black_tech_task_1/view/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryBar extends StatefulWidget {
  CategoryBar({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.categoriesList,
    required this.carsList,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  List<Categories> categoriesList;
  List<Cars> carsList;

  @override
  State<CategoryBar> createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  //making the first item in our category list as our default selected category
  late String selectedCategory = widget.categoriesList[0].title ?? '';

  //same with the car item
  late List<Cars> carsTempList = widget.categoriesList[0].cars ?? [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.screenHeight / 25,
          child: ListView.builder(
            itemCount: widget.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) => Padding(
                  padding: EdgeInsets.only(right: widget.screenWidth / 50),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // setting the dynamic values in category and car on click
                        selectedCategory =
                            widget.categoriesList[index].title ?? '';
                        carsTempList = widget.categoriesList[index].cars ?? [];
                      });
                    },
                    child: SingleCategoryTile(
                      isSelected: selectedCategory ==
                          widget.categoriesList[index].title,
                      categories: widget.categoriesList[index],
                      screenWidth: widget.screenWidth,
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: widget.screenHeight / 30,
        ),
        Expanded(
            child: CarTile(
          screenWidth: widget.screenWidth,
          screenHeight: widget.screenHeight,
          cars: carsTempList,
          categoryName: selectedCategory,
        )),
        CustomButton(
          label: "Show All Cars",
          screenWidth: widget.screenWidth,
          onPress: () {
            Get.to(() => SortedCarView(carsList: widget.carsList));
          },
        )
      ],
    );
  }
}
