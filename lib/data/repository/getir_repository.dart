
import 'package:getir_clone_app/data/entity/list_view.dart';

class GetirRepository {

  Future<List<CategoryModel>> categoryList() async {
    var categoryList =<CategoryModel>[];
    var category1 =  CategoryModel(categories: "Süper İkili", image: "assets/images/im_super.png");
    var category2 =  CategoryModel(categories: "İndirimler", image: "assets/images/im_discount.png");
    var category3 =  CategoryModel(categories: "Yeni Ürünler", image: "assets/images/im_new_product.png");
    var category4 =  CategoryModel(categories: "Su & İçecek", image: "assets/images/im_drink.png");
    var category5 =  CategoryModel(categories: "Meyve & S..", image: "assets/images/im_fruit_vegetable.png");
    var category6 =  CategoryModel(categories: "Fırından", image: "assets/images/im_bakery.png");
    var category7 =  CategoryModel(categories: "Temel Gıda", image: "assets/images/im_basic_food.png");
    var category8 =  CategoryModel(categories: "Atıştırmalık", image: "assets/images/im_snack.png");
    var category9 =  CategoryModel(categories: "Dondurma", image: "assets/images/im_ice_cream.png");
    var category10 =  CategoryModel(categories: "Süt Ürünleri", image: "assets/images/im_milk_products.png");
    var category11 =  CategoryModel(categories: "Kahvaltılık", image: "assets/images/im_breakfast.png");
    var category12 =  CategoryModel(categories: "Yiyecek", image: "assets/images/im_food.png");
    var category13 =  CategoryModel(categories: "Fit & Form", image: "assets/images/im_fit_form.png");
    var category14 =  CategoryModel(categories: "Kişisel Bakım", image: "assets/images/im_personal_care.png");
    var category15 =  CategoryModel(categories: "Ev Bakım", image: "assets/images/im_care.png");
    var category16 =  CategoryModel(categories: "Ev & Yaşam", image: "assets/images/im_life.png");
    var category17 =  CategoryModel(categories: "Teknoloji", image: "assets/images/im_technology.png");
    var category18 =  CategoryModel(categories: "Evcil Hayvan", image: "assets/images/im_pet.png");
    var category19 =  CategoryModel(categories: "Bebek", image: "assets/images/im_baby.png");
    var category20 =  CategoryModel(categories: "Cinsel Sağlık", image: "assets/images/im_sexual.png");
    categoryList.add(category1);
    categoryList.add(category2);
    categoryList.add(category3);
    categoryList.add(category4);
    categoryList.add(category5);
    categoryList.add(category6);
    categoryList.add(category7);
    categoryList.add(category8);
    categoryList.add(category9);
    categoryList.add(category10);
    categoryList.add(category11);
    categoryList.add(category12);
    categoryList.add(category13);
    categoryList.add(category14);
    categoryList.add(category15);
    categoryList.add(category16);
    categoryList.add(category17);
    categoryList.add(category18);
    categoryList.add(category19);
    categoryList.add(category20);
    return categoryList;

  }
}