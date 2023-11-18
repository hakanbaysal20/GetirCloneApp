import 'package:flutter/material.dart';
import 'package:getir_clone_app/data/entity/page_view.dart';

class PageViewCard extends StatelessWidget {
  const PageViewCard({Key? key, required this.model}) : super(key: key);
  final PageViewModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(model.imageWithPath),

    );
  }
}
