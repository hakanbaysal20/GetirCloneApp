
class CategoryModel {
  int category_id;
  String category_name;
  String category_image;

  CategoryModel({required this.category_id,required this.category_name,required this.category_image});
  String get imageWithPath => 'assets/images/$category_image.png';
}







