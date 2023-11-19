
class ListViewModel {
  String categories;
  String image;

  ListViewModel({required this.categories,required this.image});
  String get imageWithPath => 'assets/images/$image.png';
}







