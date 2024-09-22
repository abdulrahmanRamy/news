import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

import 'custom_list_title_widget.dart';

class HomeDrawer extends StatelessWidget {
  static const int categories = 1;
  static const int settings = 2;
  Function onSideMenuItemClick;
   HomeDrawer({required this.onSideMenuItemClick,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
              ),
              child: Center(
                child: Text("News App!",
                  style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
              )),
          CustomListTitleWidget(
            title: "Category",
            icon: Icons.list,
            onTap: (){
              onSideMenuItemClick(categories);
            },),
          CustomListTitleWidget(
            title: "Settings",
            icon: Icons.settings,
            onTap: (){
              onSideMenuItemClick(settings);
            },),

        ],
      ),
    );
  }
}
