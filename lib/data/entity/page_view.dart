class PageViewModel {
  String image;
  int imageId;

  PageViewModel({required this.image,required this.imageId});
  String get imageWithPath => 'assets/images/$image.png';
}

class PageViewItems  {

  static final List<PageViewModel> pageViewItems = [
    PageViewModel(image: 'im_board_getir', imageId: 1),
    PageViewModel(image: 'im_board_promo_2', imageId: 2),
    PageViewModel(image: 'im_board_free', imageId: 3),
    PageViewModel(image: 'im_board_iphone', imageId: 4),
    PageViewModel(image: 'im_board_promo', imageId: 5),



  ];



}