import 'package:flutter/material.dart';
import 'package:getir_clone_app/constants/color_constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECECEC),
      appBar: AppBar(title: Text("Arama",style: TextStyle(color: Colors.white)),backgroundColor: ColorConstants.primaryColor,centerTitle: true,automaticallyImplyLeading: false,),
      body: Column(

        children: [
          Container(
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0,left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(border:InputBorder.none,hintText: "Ürün Ara",icon: Icon(Icons.search)),
                      controller: search,
                    ),
                  ),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.mic))
                ],
              ),
            ),
          ),
          Text("Popüler Aramalar",style: TextStyle(color: Colors.grey),),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                TextButton(onPressed: () {

                },
                  child: Text("cips",style: TextStyle(color: ColorConstants.primaryColor),),
                  style: TextButton.styleFrom(shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12),borderRadius: BorderRadius.all(Radius.circular(12)))),)
              ],
            ),

          ),
          Text("Sık Aldıklarım",style: TextStyle(color: Colors.grey),),
          Container(
            width: double.infinity,
            color: Colors.white,
            height: 200,

            child: Row(
              children: [
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Align(
                          widthFactor: 1.35,
                          heightFactor: 1.35,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: Colors.black12),borderRadius: BorderRadius.all(Radius.circular(12))),
                            width: 120,
                            height: 120,
                            child: Image.asset("assets/images/im_drink.png",),
                          ),
                        ),

                        IconButton(
                            style: IconButton.styleFrom(backgroundColor: Colors.white,shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black12),borderRadius: BorderRadius.all(Radius.circular(12)))),
                            onPressed: () {

                            }, icon: Icon(Icons.add,color: ColorConstants.primaryColor,)),
                      ],
                    ),
                    Text("₺ 21,99",style: TextStyle(color: ColorConstants.primaryColor,fontWeight: FontWeight.bold)),

                  ],
                ),

              ],
                ),
          ),
      ]
     ),
    );
  }
}
