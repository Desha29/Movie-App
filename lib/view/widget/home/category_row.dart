import 'package:flutter/material.dart';
import '/../view/widget/home/category_button.dart';

class CategoryRow extends StatelessWidget {
  const CategoryRow({
    super.key,
    required this.CategoryNames,
  });

  final List<String> CategoryNames;

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
