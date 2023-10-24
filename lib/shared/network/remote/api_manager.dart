import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news/models/NewsDataModel.dart';
import 'package:news/models/SourcesResponse.dart';

import '../../components/constants.dart';

class ApiManager {
  static Future<SourcesResponce> getSource() async {
    try{
      Uri url = Uri.https(BASE, "/v2/top-headlines/sources",
          {"apiKey": APIKEY});
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      SourcesResponce sourcesResponce = SourcesResponce.fromJson(jsonData);
      return sourcesResponce;
    }catch(e){
      throw Exception;
    }
  }

  static Future<NewsDataModel> getNewsData(String sourceId)async{
    
    Uri url = Uri.https(BASE,"/v2/everything",{"apiKey": APIKEY,"sources":sourceId});
    Response response=await http.get(url);
    var json = jsonDecode(response.body);
    NewsDataModel newsDataModel = NewsDataModel.fromJson(json);
    return newsDataModel;
  }
}
