import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getir_clone_app/constants/color_constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECECEC),
      appBar: AppBar(title: const Text("Arama",style: TextStyle(color: Colors.white,fontSize: 18),),centerTitle: true,backgroundColor: ColorConstants.primaryColor,),
      body: Column(
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: Colors.black12))),
            child: Padding(
              padding: const EdgeInsets.only(right: 16,left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: const Icon(Icons.person,size: 45,color: ColorConstants.primaryColor,),
                      ),

                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text("Hakan Baysal",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor,size: 18,),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white,border: Border(bottom: BorderSide(color: Colors.black12))),
            child: const Padding(
              padding: EdgeInsets.only(right: 16,left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.local_post_office,color: ColorConstants.primaryColor,),
                  Text("l1921012007@stud.edu.tr",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54),),
                  SizedBox(width: 120),
                  Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor,size: 18,)
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            decoration: const BoxDecoration(color: Colors.white),
            child: const Padding(
              padding: EdgeInsets.only(right: 16,left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.phone_android_sharp,color: ColorConstants.primaryColor,),
                  Text("+90 555 555 55 555",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black54),),
                  SizedBox(width: 165),
                  Icon(Icons.arrow_forward_ios,color: ColorConstants.primaryColor,size: 18,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
