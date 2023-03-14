class HomeModel {
  List<Categories>? categories;

  HomeModel({this.categories});
}

class Categories {
  String? title;
  String? subtitle;
  List<Cars>? cars;

  Categories({this.title, this.subtitle, this.cars});
}

class Cars {
  String? name;
  String? detail;
  String? image;
  String? dateAdded;

  Cars({this.name, this.detail, this.image, this.dateAdded});
}
