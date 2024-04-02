import 'package:flutter/material.dart';
import '/../view/widget/home/category_button.dart';

class CategoryRow extends StatelessWidget {
  CategoryRow({
    super.key,

  });

 final List<String> CategoryNames = [
    "Action",
    "Drama",
    "Comedy",
    "Horror",
    "Romance",
    "Cartoon"
  ];


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: CategoryNames.length,
      itemBuilder: (context, index) {
        return CategoryButton(categoryName: CategoryNames[index]);
      },
    );
  }
}
