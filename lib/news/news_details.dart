import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_colors.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "NewsDetails";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
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
                news.content ?? "",
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
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: (){
                  _launchUrl(news.url ?? '');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article'),
                    Icon(Icons.arrow_back,),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);

    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }
}
