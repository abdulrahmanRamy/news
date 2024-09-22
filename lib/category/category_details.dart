import 'package:flutter/material.dart';
import 'package:news/models/category_data.dart';
import '../app_colors.dart';
import '../home/tabs/tab_widget.dart';
import '../models/SourceResponse.dart';
import '../models/api_manager.dart';

class CategoryDetails extends StatefulWidget {
  CategoryData categoryData;
   CategoryDetails({required this.categoryData,super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSources(widget.categoryData.id),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something Went Wrong'),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getSources(widget.categoryData.id);
                      setState(() {});

                    },
                    child: Text('Try Again'))
              ],
            );
          }
          // server  => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getSources(widget.categoryData.id);
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          var sourceList = snapshot.data!.sources!;
          return TabWidget(sourcesList: sourceList,);
        }
    );
  }
}
