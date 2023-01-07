import 'package:flutter/material.dart';
class DrawerWidget extends StatelessWidget {
  Function drawerAction;
  static int CATEGORY_NUMBER = 1;
  static int SETTING_NUMBER = 2;
  DrawerWidget(this.drawerAction);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .80,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 60),
            color: Colors.green,
            child: Center(
                child: Text(
              'News App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
            )),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.list,size: 40),
                InkWell(
                    onTap: () {
                      drawerAction(CATEGORY_NUMBER);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('  Categories',style: TextStyle(fontSize:  24)),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(Icons.settings,size:40),
                InkWell(
                    onTap: () {
                      drawerAction(SETTING_NUMBER);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('  Settings',style: TextStyle(fontSize:  24)),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
