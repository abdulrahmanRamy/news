import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/category/category_fragment.dart';
import 'package:news/models/category_data.dart';
import 'package:news/settings/settings_tab.dart';
import '../../category/category_details.dart';
import '../../search/new_search_delegate.dart';
import 'home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset("assets/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
    ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              selectedSideMenuItem == HomeDrawer.settings ? 'Settings':
                  selectedCategory == null ?
              'News App' : selectedCategory!.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: [
              IconButton(
                  onPressed: () => showSearch(context: context ,delegate: NewSearchDelegate()),
                  icon: Icon(Icons.search,size: 30,))
            ],
          ),
          drawer: Drawer(
            child: HomeDrawer(onSideMenuItemClick: onSideMenuItemClick,),
          ),
          body: selectedSideMenuItem == HomeDrawer.settings ?
              SettingsTab()
              :
          selectedCategory == null ?
          CategoryFragment(onCategoryItemClick: onCategoryItemClick,):
          CategoryDetails(categoryData: selectedCategory!),
        )
      ]);
  }

  CategoryData? selectedCategory ;
  void onCategoryItemClick(CategoryData newCategory){
    //  newCategory => user select
    selectedCategory = newCategory;
    setState(() {});
  }


  int selectedSideMenuItem = HomeDrawer.categories;
  void onSideMenuItemClick(int newSideMenuItem){
    //  newSideMenuItem => user select
    selectedSideMenuItem = newSideMenuItem;
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
