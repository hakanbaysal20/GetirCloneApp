
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/constants/color_constants.dart';
import 'package:getir_clone_app/data/entity/list_models.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';
import 'package:getir_clone_app/ui/cubit/home_cubit.dart';
import 'package:getir_clone_app/ui/views/page_view_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {
  PageController pageController = PageController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadCategory();
    context.read<HomeCubit>().loadAdress();
    pageController = PageController(viewportFraction: 0.9);
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: ColorConstants.primaryColor,title: Image.asset("assets/images/im_getir.png"),centerTitle: true,),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        Expanded(flex: 6,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(12),topRight: Radius.circular(12))),
                            child: Row(
                                children: [
                                  ShowButton(),
                    ],
                  ),
                          ),
                        ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            color: ColorConstants.brandYellow,
                            child: const Column(
                                children: [
                                  Text("TVS",style: TextStyle(color: ColorConstants.primaryColor,fontWeight: FontWeight.w500),),
                                  Text("35dk",style: TextStyle(color: ColorConstants.primaryColor,fontSize: 20,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: PageViewItems.pageViewItems.length,
                    itemBuilder: (context, index) {
                      return PageViewCard(model: PageViewItems.pageViewItems[index]);
                    },
                  ),
                ),
                BlocBuilder<HomeCubit,ListModels>(
                    builder: (context, state) {
                      if(state.categoryModel.isNotEmpty){
                        return GridView.builder(
                          physics: BouncingScrollPhysics(),
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
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(12)),color: ColorConstants.greyLight),
                                      child: Image.asset(category.category_image,fit: BoxFit.contain),
                                    ),
                                      Text(category.category_name,style: const TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.w600,fontSize: 14,color: ColorConstants.blackLight),),
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

class ShowButton extends StatelessWidget {
  const ShowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => DraggableScrollableSheet(expand: false,
          builder: (context, scrollController) => SingleChildScrollView(
          controller: scrollController,
          child: Column(
              children: [

                const Padding(
                  padding: EdgeInsets.only(right: 16, left:16,top: 32 ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Teslimat adresinizi seçin.",
                        style: TextStyle(fontWeight: FontWeight.w400,color: ColorConstants.blackLight,fontSize: 16),),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,color: ColorConstants.primaryColor,),
                          Text(
                            "Adreslerim",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,decoration: TextDecoration.underline,
                                color: ColorConstants.primaryColor),

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
                          physics: BouncingScrollPhysics(),
                          itemCount: state.adressModel.length,
                            itemBuilder: (context, index) {
                            var adress = state.adressModel[index];
                            return Container(
                              decoration: const BoxDecoration(
                                  border: Border(top: BorderSide(color: ColorConstants.blackLight))),
                              child: TextButton(onPressed: () {

                              }, child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/images/ic_home.png"),
                                      Text(adress.type.type_name,style: TextStyle(color: ColorConstants.blackLight),),
                                    ],
                                  ),
                                  Text("${adress.adress_path} ${adress.city.city_name} Merkez",style: TextStyle(color: ColorConstants.blackLight),),
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
    }, child: Row(
      children: [
        Text("Ev,  ",style: TextStyle(color: ColorConstants.primaryColor,fontWeight: FontWeight.bold,fontSize: 16),),
        Text("Zafer Gazoz, horoz sokak,bina..",style: TextStyle(color: Colors.black,fontFamily: 'OpenSans',fontWeight: FontWeight.w400),),
        SizedBox(width: 15),
        Icon(Icons.keyboard_arrow_down_outlined,color: ColorConstants.primaryColor,),

      ],
    ));
  }
}
