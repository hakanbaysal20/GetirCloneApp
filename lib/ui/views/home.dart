import 'package:flutter/material.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';
import 'package:getir_clone_app/ui/views/page_view_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,title: Image.asset("assets/images/im_getir.png"),centerTitle: true,),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                print("Tıklandı");
              },
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: PageView.builder(
                  itemCount: PageViewItems.pageViewItems.length ,
                  itemBuilder: (context, index) {
                    return PageViewCard(model: PageViewItems.pageViewItems[index]);
                  },
                ),
              ),
            ),


          ],
        ),

      ),


    );
  }
}
