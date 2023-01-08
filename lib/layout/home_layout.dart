import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/categories/categories_screen.dart';
import '../screens/drawer/drawer_widget.dart';
import '../screens/home_screen.dart';
import '../screens/search/search_screen.dart';
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
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.099),
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
              child: Text('News App',
                  style: TextStyle(fontWeight: FontWeight.w300)),
            ),
            actions: [
              SelectedCategorItem != null
                  ? InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, SearchScreen.routeName);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.search, size: 30),
                      ),
                    )
                  : Text('')
            ],
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
