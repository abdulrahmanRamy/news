import 'dart:ui';

import 'package:news/app_colors.dart';

class CategoryData{
  String id;
  String imagePath;
  String title;
  Color color;

  CategoryData({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.color,
  });

  //business entertainment general health science sports technology

  static List<CategoryData> getCategories(){
    return [
      CategoryData(
          id: 'sports',
          imagePath: 'assets/sports.png',
          title: 'Sports',
          color: AppColors.redColor
      ),
      CategoryData(
          id: 'general',
          imagePath: 'assets/Politics.png',
          title: 'General',
          color: AppColors.darkBlueColor
      ),
      CategoryData(
          id: 'health',
          imagePath: 'assets/health.png',
          title: 'health',
          color: AppColors.pinkColor
      ),
      CategoryData(
          id: 'business',
          imagePath: 'assets/bussines.png',
          title: 'Business',
          color: AppColors.brownColor
      ),
      CategoryData(
          id: 'entertainment',
          imagePath: 'assets/environment.png',
          title: 'Entertainment',
          color: AppColors.blueColor
      ),
      CategoryData(
          id: 'science',
          imagePath: 'assets/science.png',
          title: 'Science',
          color: AppColors.yellowColor
      ),
    ];
  }

}
