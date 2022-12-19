import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_c7_mon/models/SourcesResponse.dart';
import 'package:news_c7_mon/shared/components/constants.dart';

class ApiManager{


  static Future<SourcesResponse> getSources()async{

    Uri URL=Uri.https(BASE, '/v2/top-headlines/sources',
    {"apiKey":APIRKEY});

   Response response= await http.get(URL);
   var json=jsonDecode(response.body);
   SourcesResponse sourcesResponse=SourcesResponse.fromJson(json);
   return sourcesResponse;

  }
}