import 'package:flutter/material.dart';
import 'package:getir_clone_app/data/entity/list_view.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';
import 'package:getir_clone_app/ui/views/page_view_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<ListViewModel>> categoryList() async {
   var categoryList =<ListViewModel>[];
   var category1 =  ListViewModel(categories: "Yaz Özel", image: "assets/images/im_special_summer.png");
   var category2 =  ListViewModel(categories: "İndirimler", image: "assets/images/im_discount.png");
   var category3 =  ListViewModel(categories: "Bana Özel", image: "assets/images/im_special.png");
   var category4 =  ListViewModel(categories: "Su & İçecek", image: "assets/images/im_drink.png");
   var category5 =  ListViewModel(categories: "Meyve & S..", image: "assets/images/im_fruit_vegetable.png");
   var category6 =  ListViewModel(categories: "Fırından", image: "assets/images/im_bakery.png");
   var category7 =  ListViewModel(categories: "Temel Gıda", image: "assets/images/im_basic_food.png");
   var category8 =  ListViewModel(categories: "Atıştırmalık", image: "assets/images/im_snack.png");
   var category9 =  ListViewModel(categories: "Dondurma", image: "assets/images/im_ice_cream.png");
   var category10 =  ListViewModel(categories: "Süt Ürünleri", image: "assets/images/im_milk_products.png");
   var category11 =  ListViewModel(categories: "Kahvaltılık", image: "assets/images/im_breakfast.png");
   var category12 =  ListViewModel(categories: "Yiyecek", image: "assets/images/im_food.png");
   var category13 =  ListViewModel(categories: "Fit & Form", image: "assets/images/im_fit_form.png");
   var category14 =  ListViewModel(categories: "Kişisel Bakım", image: "assets/images/im_personal_care.png");
   var category15 =  ListViewModel(categories: "Ev Bakım", image: "assets/images/im_care.png");
   var category16 =  ListViewModel(categories: "Ev & Yaşam", image: "assets/images/im_life.png");
   var category17 =  ListViewModel(categories: "Teknoloji", image: "assets/images/im_technology.png");
   var category18 =  ListViewModel(categories: "Evcil Hayvan", image: "assets/images/im_pet.png");
   var category19 =  ListViewModel(categories: "Bebek", image: "assets/images/im_baby.png");
   var category20 =  ListViewModel(categories: "Cinsel Sağlık", image: "assets/images/im_sexual.png");
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.deepPurple,title: Image.asset("assets/images/im_getir.png"),centerTitle: true,),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Ev,",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 15),),
                                Text("Mehmet Akif Ersoy, 42/5. Soka...",style: TextStyle(fontSize: 15),),
                                Icon(Icons.keyboard_arrow_down,color: Colors.deepPurple,),

                              ],
                            ),
                        ),
                        flex: 6,
                      ),/*
                      Expanded(
                        flex: 1,
                        child:
                      ),*/
                      Expanded(
                        flex: 2,
                        child: Container(
                            color: Color(0XFFF7D102),
                            child: Column(
                              children: [
                                Text("Tvs",style: TextStyle(color: Colors.deepPurple),),
                                Text("15-20 dk",style: TextStyle(color: Colors.deepPurple),),
                              ],
                            ),
                          ),
                      ),


                    ],
                  ),
                ),


                   SizedBox(
                     width: 400,
                     height: 200,
                     child: PageView.builder(
                      itemCount: PageViewItems.pageViewItems.length ,
                      itemBuilder: (context, index) {
                            return PageViewCard(model: PageViewItems.pageViewItems[index]);
                          },
                  ),
                   ),

                  FutureBuilder<List<ListViewModel>>(
                    future: categoryList(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        var categoryList = snapshot.data;
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 1.5,
                          ),
                          itemCount: categoryList!.length,
                          itemBuilder: (context, index) {
                            var category = categoryList[index];
                            return  Padding(
                              padding: EdgeInsets.only(right: 8,left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("${category.image}"),
                                      Text(category.categories),
                                  ],
                                ),
                            );


                          },
                        );
                      }else{
                        return const Center();
                      }

                    },

                  ),


              ],
            ),

          ),
        ),


      );
    
  }
}
