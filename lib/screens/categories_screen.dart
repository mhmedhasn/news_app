
import 'package:flutter/material.dart';
import 'package:news_c7_fri/shared/styles/my_theme.dart';

import '../models/category.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function callBack;
  CategoriesScreen(this.callBack);

  @override
  Widget build(BuildContext context) {
    var categories=Category.getCategories();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category \n of interest',style:TextStyle(
            fontSize:22 ,
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold
          ),),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: (){
                        callBack(categories[index]);
                      },
                      child: CategoryItem(categories[index],index));
                },),
          )
        ],
      ),
    );
  }
}
