import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';

class CustomListTitleWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  void Function() onTap;

  CustomListTitleWidget({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon,size: 35,color: AppColors.blackColor,),
      title: Text(title,style: Theme.of(context).textTheme.titleMedium),);
  }
}
