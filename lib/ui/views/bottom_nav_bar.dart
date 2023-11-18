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
      floatingActionButton: FloatingActionButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),onPressed: () {

      },child: Icon(Icons.add,color: Colors.yellowAccent,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,

        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.card_giftcard),label: ""),
        ],
      ),
    );
  }
}
