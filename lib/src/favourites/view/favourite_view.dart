import 'package:black_tech_task_1/constants.dart';
import 'package:black_tech_task_1/src/favourites/controller/favourite_controller.dart';
import 'package:black_tech_task_1/src/home/view/components/single_car_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends StatelessWidget {
  FavouriteView({
    super.key,
  });

  final favController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text("Faourite Cars"),
        ),
        body: Obx(
          () => favController.favouriteList.isEmpty
              ? const Center(
                  child: Text("No Items to show"),
                )
              : Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        mainAxisExtent: screenHeight * .26),
                    itemCount: favController.favouriteList.length,
                    itemBuilder: (context, index) => SingleCarTile(
                      cars: favController.favouriteList[index],
                      isFavourite: true,
                    ),
                  ),
                ),
        ));
  }
}
