import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/data/entity/list_view.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';
import 'package:getir_clone_app/ui/cubit/home_cubit.dart';
import 'package:getir_clone_app/ui/views/page_view_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int currentPage;
  var pageController = PageController();
  late Timer timer;
  @override
  void dispose() {
    pageController.dispose();
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadCategory();
    currentPage = 0;
    pageController = PageController(initialPage: currentPage);

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      scrollPage();
    });
  }
  void scrollPage(){
    currentPage = (currentPage + 1) % PageViewItems.pageViewItems.length;

    pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

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
                       const Expanded(
                        flex: 6,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Ev,",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 15),),
                              Text("Mehmet Akif Ersoy, 42/5. Soka...",style: TextStyle(fontSize: 15),),
                              Icon(Icons.keyboard_arrow_down,color: Colors.deepPurple,),
                            ],
                          ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),topLeft: Radius.circular(12)),color: Color(0XFFF7D102),),
                          child: const Column(
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
                       physics: const BouncingScrollPhysics(),

                      itemCount: PageViewItems.pageViewItems.length ,
                      itemBuilder: (context, index) {
                            return PageViewCard(model: PageViewItems.pageViewItems[index]);
                          },
                  ),
                   ),

                  BlocBuilder<HomeCubit,List<CategoryModel>>(
                    builder: (context, categoryList) {
                      if(categoryList.isNotEmpty){
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 1.3,
                          ),
                          itemCount: categoryList!.length,
                          itemBuilder: (context, index) {
                            var category = categoryList[index];
                            return  Padding(
                              padding: const EdgeInsets.only(right: 8,left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset("${category.image}"),
                                      Text(category.categories,style: const TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.w600),),
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
