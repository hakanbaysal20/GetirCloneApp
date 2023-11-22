
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/data/entity/list_model.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';
import 'package:getir_clone_app/ui/cubit/home_cubit.dart';
import 'package:getir_clone_app/ui/views/page_view_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadCategory();
    context.read<HomeCubit>().loadAdress();
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
                        flex: 6,
                        child: Row(
                            children: [
                              TextButton(onPressed: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => DraggableScrollableSheet(expand: false,builder: (context, scrollController) => SingleChildScrollView(
                                    controller: scrollController,
                                    child: Column(
                                        children: [

                                          const Padding(
                                            padding: EdgeInsets.only(right: 16, left:16,top: 32 ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Teslimat adresinizi seçin.",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.black54,fontSize: 16),),
                                                Row(
                                                  children: [
                                                    Icon(Icons.location_on_outlined,color: Colors.deepPurple,),
                                                    Text(
                                                      "Adreslerim",
                                                      style: TextStyle(fontWeight: FontWeight.bold,decoration: TextDecoration.underline,color: Colors.deepPurple),

                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                           BlocBuilder<HomeCubit,ListModels>(
                                             builder: (context, state) {
                                               if(state.adressModel.isNotEmpty){
                                                return SizedBox(
                                                  height: 400,
                                                  width: 400,
                                                  child: ListView.builder(
                                                    itemCount: state.adressModel.length,
                                                      itemBuilder: (context, index) {
                                                      var adress = state.adressModel[index];
                                                      return Container(
                                                        decoration: const BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
                                                        child: TextButton(onPressed: () {

                                                        }, child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Image.asset("assets/images/ic_home.png"),
                                                                Text(adress.type_id.toString()),
                                                              ],
                                                            ),
                                                            Text(adress.adress_path),
                                                           ],
                                                          ),
                                                        ),
                                                      );

                                                      },

                                                   ),
                                                );
                                               }else{
                                                 return const Center();
                                               }

                                           },)
                                            ],
                                          ),

                                          ],
                                        ),
                                    ),
                                  ),
                                );
                              }, child: const Text("MEHMET AKİF ERSOY MAH")),

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

                  BlocBuilder<HomeCubit,ListModels>(
                    builder: (context, state) {
                      if(state.categoryModel.isNotEmpty){
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 1 / 1.3,
                          ),
                          itemCount: state.categoryModel.length,
                          itemBuilder: (context, index) {
                            var category = state.categoryModel[index];
                            return  Padding(
                              padding: const EdgeInsets.only(right: 8,left: 8),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),color: Color(0xF919191)),
                                      child: Image.asset(category.category_image,fit: BoxFit.contain),
                                    ),
                                      Text(category.category_name,style: const TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.w600),),
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
