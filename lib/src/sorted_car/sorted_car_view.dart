import 'package:black_tech_task_1/constants.dart';
import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:black_tech_task_1/src/home/view/components/single_car_tile.dart';
import 'package:black_tech_task_1/view/components/custom_button.dart';
import 'package:flutter/material.dart';

class SortedCarView extends StatefulWidget {
  SortedCarView({super.key, required this.carsList});

  List<Cars> carsList;

  @override
  State<SortedCarView> createState() => _SortedCarViewState();
}

class _SortedCarViewState extends State<SortedCarView> {
  getCarsNamesOnly() {}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title: const Text("All Cars"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    label: "Sort By Ascending",
                    screenWidth: screenWidth * .4,
                    onPress: () {
                      setState(() {
                        widget.carsList.sort((a, b) {
                          return a.name!.compareTo(b.name ?? '');
                        });
                      });
                    },
                  ),
                  CustomButton(
                    label: "Sort By Descending",
                    screenWidth: screenWidth * .4,
                    onPress: () {
                      setState(() {
                        widget.carsList.sort((a, b) {
                          return b.name!.compareTo(a.name ?? '');
                        });
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight / 40,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: screenHeight * .26),
                  itemCount: widget.carsList.length,
                  itemBuilder: (context, index) => SingleCarTile(
                    cars: widget.carsList[index],
                    isFavourite: true,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
