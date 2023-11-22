import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: FloatingActionButton(backgroundColor: Color(0xFF5D3EBD),shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed: () {

        },child: Image.asset("assets/images/ic_fab.png",color:Color(0XFFF7D102),height: 50,width: 50,)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 60,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {

            }, icon: Icon(Icons.home,size: 30,color: Color(0xFF5D3EBD),)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.search,size: 30,)),
            SizedBox(width: 24),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.person,size: 30,)),
            IconButton(onPressed: () {

            }, icon: Icon(Icons.card_giftcard,size: 30,)),
          ],
        ),
      ),
    );
  }
}
