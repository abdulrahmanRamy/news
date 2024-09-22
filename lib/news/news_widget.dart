import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/api_manager.dart';
import 'package:news/models/news_response.dart';
import 'package:news/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
   NewsWidget({required this.source,super.key});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??""),
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
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {});
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
                  ApiManager.getNewsBySourceId(widget.source.id??'');
                  setState(() {});
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
  }
}
