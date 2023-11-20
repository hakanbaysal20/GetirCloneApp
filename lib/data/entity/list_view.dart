
class CategoryModel {
  String categories;
  String image;

  CategoryModel({required this.categories,required this.image});
  String get imageWithPath => 'assets/images/$image.png';
}







