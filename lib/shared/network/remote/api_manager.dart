import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_c7_mon/models/SourcesResponse.dart';
import 'package:news_c7_mon/shared/components/constants.dart';

import '../../../models/NewsDataModel.dart';

class ApiManager{


  static Future<SourcesResponse> getSources(String categoryID)async{

    Uri URL=Uri.https(BASE, '/v2/top-headlines/sources',
    {"apiKey":APIRKEY,"category":categoryID});
   Response response= await http.get(URL);
   var json=jsonDecode(response.body);
   SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
   return sourcesResponse;

  }
  
  static Future<NewsDataModel> getNewsData(String sourceId)async{
    Uri URL=Uri.https(BASE, '/v2/everything',
    {"apiKey":APIRKEY,"sources":sourceId});
   Response response=await http.get(URL);
   var json=jsonDecode(response.body);
    NewsDataModel newsDataModel=NewsDataModel.fromJson(json);
    return newsDataModel;

  }
}