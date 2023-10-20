import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/SourcesResponse.dart';

class ApiManager {
  static Future<SourcesResponce> getSource() async {
    try{
      Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
          {"apiKey": "53c1d34437864dfe9c06f53f012b765e"});
      http.Response response = await http.get(url);

      var jsonData = jsonDecode(response.body);

      SourcesResponce sourcesResponce = SourcesResponce.fromJson(jsonData);
      return sourcesResponce;
    }catch(e){
      throw Exception;
    }
  }
}
