import 'package:black_tech_task_1/constants.dart';
import 'package:black_tech_task_1/src/favourites/controller/favourite_controller.dart';
import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleCarTile extends StatefulWidget {
  SingleCarTile({
    Key? key,
    required this.cars,
    this.categoryName,
    required this.isFavourite,
  }) : super(key: key);

  final Cars cars;
  final String? categoryName;
  bool isFavourite;

  @override
  State<SingleCarTile> createState() => _SingleCarTileState();
}

class _SingleCarTileState extends State<SingleCarTile> {
  double screenHeight = 0;

  List<Cars> favouriteList = [];

  final favController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: primaryColor.withOpacity(.2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            widget.cars.image ?? 'assets/images/magna.png',
            height: 100,
            width: 100,
          ),
          widget.categoryName == ""
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.categoryName ?? '',
                      style: const TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.cars.dateAdded ?? "",
                      style: const TextStyle(
                        color: secondaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
          SizedBox(
            height: screenHeight / 80,
          ),
          Text("${widget.cars.name}"),
          const Divider(
            color: secondaryColor,
          ),
          Text("${widget.cars.detail}"),
          widget.isFavourite
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    favController.addToFavourite(widget.cars);
                  },
                  child: const Align(
                      alignment: Alignment.bottomRight,
                      child: Icon(
                        Icons.favorite_outline,
                        color: Colors.red,
                      )))
        ],
      ),
    );
  }
}
