import 'package:flutter/material.dart';
import 'package:news_c7_fri/models/category.dart';
import 'package:news_c7_fri/screens/category_item.dart';
import 'package:news_c7_fri/screens/drawer_widget.dart';
import 'package:news_c7_fri/shared/network/remote/api_manager.dart';

import '../models/SourcesResponse.dart';
import '../screens/categories_screen.dart';
import '../screens/home_screen.dart';
import '../screens/news_item.dart';
class HomeLayout extends StatefulWidget {
  static const String routeName = 'HOme';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, MediaQuery.of(context).size.height*0.099),
          child: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            shape: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text('News App', style: TextStyle(fontWeight: FontWeight.w300)),
            ),
            actions: [
              SelectedCategorItem!=null?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.search,size: 30),
              ):Text('')],
          ),
        ),
        drawer: DrawerWidget(whenOpenDrawer),
        body: SelectedCategorItem == null
            ? CategoriesScreen(SelectedCategoryCallBack)
            : HomeScreen(SelectedCategorItem!),
      ),
    );
  }

  Category? SelectedCategorItem = null;

  void whenOpenDrawer(selectedNumber) {
    if (selectedNumber == DrawerWidget.CATEGORY_NUMBER) {
      SelectedCategorItem = null;
    } else if (selectedNumber == DrawerWidget.SETTING_NUMBER) {
      // open settings screen
    }
    setState(() {
      Navigator.pop(context);
    });
  }

  void SelectedCategoryCallBack(Category category) {
    SelectedCategorItem = category;
    setState(() {});
  }
}
