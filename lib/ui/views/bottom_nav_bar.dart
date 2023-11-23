import 'package:flutter/material.dart';
import 'package:getir_clone_app/constants/color_constants.dart';
import 'package:getir_clone_app/ui/views/campaigns.dart';
import 'package:getir_clone_app/ui/views/discovery.dart';
import 'package:getir_clone_app/ui/views/home.dart';
import 'package:getir_clone_app/ui/views/profile.dart';
import 'package:getir_clone_app/ui/views/search.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int currentIndex = 0;
  var pages = [const Home() , const Search(), const Discovery(), const Profile(), const Campaigns() ];
 @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(backgroundColor: ColorConstants.primaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed: () {

        },child: Image.asset("assets/images/ic_fab.png",color:ColorConstants.brandYellow,height: 50,width: 50,)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.home,size: 32,color: ColorConstants.primaryColor,)),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.search,size: 32,color: ColorConstants.blackLight)),
            const SizedBox(width: 24),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.person,size: 32,color: ColorConstants.blackLight)),
            IconButton(onPressed: () {

            }, icon: const Icon(Icons.card_giftcard,size: 32,color: ColorConstants.blackLight)),
          ],
        ),
      ),
    );
  }
}
