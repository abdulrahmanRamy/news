import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/models/SourceResponse.dart';

class TabItem extends StatelessWidget {
  bool isSelected ;
  Sources source;
   TabItem({required this.isSelected,required this.source,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primaryLightColor : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.primaryLightColor,
          width: 2,
        )
      ),
      child: Text(source.name??"",
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: isSelected? AppColors.whiteColor : AppColors.primaryLightColor
      ),),
    );
  }
}
