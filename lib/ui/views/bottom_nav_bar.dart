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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black54),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search,color: Colors.black54),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.black54),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard,color: Colors.black54),label: ""),

        ],
      ),
    );
  }
}
