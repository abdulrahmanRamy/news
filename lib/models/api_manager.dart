import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/SourceResponse.dart';
import 'package:news/models/news_response.dart';

import 'api_constants.dart';
class ApiManager{
//https://newsapi.org/v2/top-headlines/sources?apiKey=54b623f608a14c319c0fcd77d99bcff6

static Future<SourceResponse?> getSources(String categoryId)async{
  Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourceApi,
    {
      'apiKey' : ApiConstants.apiKey,
      'category' : categoryId
    });
  var response = await http.get(url);
  try{
    var responseBody = response.body;    // String
    var json = jsonDecode(responseBody);  // json
    return SourceResponse.fromJson(json);         // SourceResponse
  }catch(e){
    throw e;
  }
  // SourceResponse.fromJson(jsonDecode(response.body))  => one line


}


// https://newsapi.org/v2/everything?q=bitcoin&apiKey=54b623f608a14c319c0fcd77d99bcff6

static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
  Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
    'apiKey' : ApiConstants.apiKey,
    'sources' : sourceId
  });
  var response = await http.get(url);
  try{
    var responseBody = response.body;        // String
    var json = jsonDecode(responseBody);     // json
    return NewsResponse.fromJson(json);
  }catch(e){
    throw e;
  }
}


static Future<NewsResponse?> searchNews(String query)async{
  Uri url = Uri.https(ApiConstants.baseUrl,ApiConstants.newsApi,{
    'apiKey' : ApiConstants.apiKey,
    'q' : query
  });
  var response = await http.get(url);
  try{
    var responseBody = response.body;        // String
    var json = jsonDecode(responseBody);     // json
    return NewsResponse.fromJson(json);
  }catch(e){
    throw e;
  }
}
}