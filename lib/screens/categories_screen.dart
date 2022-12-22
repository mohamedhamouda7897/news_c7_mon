import 'package:flutter/material.dart';
import 'package:news_c7_mon/models/category.dart';

import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
 Function onCategorySelected;
 CategoriesScreen(this.onCategorySelected);
  @override
  Widget build(BuildContext context) {
    var categories=CategoryData.getCategories();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pick your category of interest",style:
            TextStyle(fontSize: 25,color: Colors.black),),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 14,
                    crossAxisSpacing: 14
                  ) ,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: (){
                          onCategorySelected(categories[index]);
                        },
                        child: CategoryItem(categories[index],index));
                  },
              itemCount: categories.length,),
            ),
          )
        ],
      ),
    );
  }
}
