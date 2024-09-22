import 'package:flutter/material.dart';
import 'package:news/theme/my_theme_data.dart';

import '../app_colors.dart';
import '../models/api_manager.dart';
import '../models/news_response.dart';
import '../news/news_item.dart';

class NewSearchDelegate extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: (){},
          icon: Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: ()=> showResults(context),
        icon: Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query),
        builder:  (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something Went Wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try Again'))
              ],
            );
          }
          // server => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context, index) {
            return NewsItem(news: newsList[index],);
          },
            itemCount: newsList.length,);

        },);
    } else {
      return Container();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isNotEmpty){
      return FutureBuilder<NewsResponse?>(
        future: ApiManager.searchNews(query),
        builder:  (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryLightColor,
              ),
            );
          } else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something Went Wrong'),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try Again'))
              ],
            );
          }
          // server => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManager.searchNews(query);
                }, child: Text('Try Again'))
              ],
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context, index) {
            return NewsItem(news: newsList[index],);
          },
            itemCount: newsList.length,);

        },);
    } else {
      return Container();
    }

  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    // TODO: implement appBarTheme
    return MyThemeData.lightTheme;
  }

}