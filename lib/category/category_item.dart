import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';

class CategoryItem extends StatelessWidget {
  CategoryData category;
  int index;
   CategoryItem({required this.category,required this.index,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomLeft: Radius.circular(
            index % 2 == 0 ? 25 : 0
          ),
          bottomRight: Radius.circular(
            index % 2 != 0 ? 25 : 0
          )
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath,
          height: MediaQuery.of(context).size.height*0.15,),
          Text(category.title,
          style: Theme.of(context).textTheme.titleLarge,),

        ],
      ),
    );
  }
}
