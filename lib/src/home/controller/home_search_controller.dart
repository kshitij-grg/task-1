import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:black_tech_task_1/src/home/view/components/single_car_tile.dart';
import 'package:flutter/material.dart';

class HomeSearchController extends SearchDelegate {
  HomeSearchController({
    required this.carsSearchList,
  });
  List<Cars> carsSearchList;

  @override
  TextStyle? get searchFieldStyle =>
      const TextStyle(fontSize: 14, color: Colors.grey);

  @override
  String? get searchFieldLabel => "Search for Cars";
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          query = '';
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Cars> matchedCars = [];
    for (Cars car in carsSearchList) {
      if (car.name!.toLowerCase().contains(query.toLowerCase())) {
        matchedCars.add(car);
      }
    }
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: matchedCars.isEmpty
          ? const Center(
              child: Text('No Results found',
                  style: TextStyle(
                    fontSize: 18,
                  )),
            )
          : GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: matchedCars.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.of(context).size.height * .26),
              itemBuilder: (context, index) {
                return SingleCarTile(
                  cars: matchedCars[index],
                  isFavourite: false,
                );
              }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Cars> matchedCars = [];
    for (Cars car in carsSearchList) {
      if (car.name!.toLowerCase().contains(query.toLowerCase())) {
        matchedCars.add(car);
      }
    }
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: matchedCars.isEmpty
          ? const Center(
              child: Text('No Results found',
                  style: TextStyle(
                    fontSize: 16,
                  )),
            )
          : GridView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: matchedCars.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: MediaQuery.of(context).size.height * .26),
              itemBuilder: (context, index) {
                return SingleCarTile(
                    cars: matchedCars[index], isFavourite: false);
              }),
    );
  }
}
