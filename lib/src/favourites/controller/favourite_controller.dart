import 'package:black_tech_task_1/src/home/model/home_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  RxList favouriteList = [].obs;
  final isFavourite = false.obs;

  void addToFavourite(Cars cars) {
    favouriteList.add(cars);
    isFavourite(true);
    Get.rawSnackbar(message: "Added to Favourite");
  }
}
