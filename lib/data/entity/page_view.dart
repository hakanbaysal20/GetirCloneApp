class PageViewModel {
  String image;
  int imageId;

  PageViewModel({required this.image,required this.imageId});
  String get imageWithPath => 'assets/images/$image.png';
}

class PageViewItems  {

  static final List<PageViewModel> pageViewItems = [
    PageViewModel(image: 'im_slider', imageId: 1),
    PageViewModel(image: 'im_getir_buyuk', imageId: 2),
    PageViewModel(image: 'im_getir_buyuk', imageId: 3),



  ];



}