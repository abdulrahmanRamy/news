import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_colors.dart';
import 'package:news/models/news_response.dart';

import 'news_details.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ?? "",
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              // Container(
              //   clipBehavior: Clip.antiAlias,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(25),
              //   ),
              //   child: Image.network(news.urlToImage??""),
              // )
              SizedBox(
                height: 10,
              ),
              Text(
                news.author ?? "",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                news.title ?? "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                news.publishedAt?.substring(0, 10) ?? "",
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
