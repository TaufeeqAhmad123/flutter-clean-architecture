import 'dart:convert';

import 'package:flutter_clean_architecture/core/constaant/constant.dart';

import 'package:retrofit/retrofit.dart';
import 'package:http/http.dart' as  http;
import '../../models/articale_model.dart';

@RestApi(baseUrl: newsApiBaseURL)
 class NewsApiService {
  //factory NewsApiService(Dio dio,) = _NewsApiService;

  Future<List<ArticaleModel>> getNewsArticals() async {
   try{
    final response = await http.get(
      Uri.parse(newsApiBaseURL),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $newsApiKey',
      },
    );
    if(response.statusCode == 200){
      final List< dynamic> jsonList = jsonDecode(response.body);
      //check api response
      print(jsonList);
    
      return jsonList.map((json) => ArticaleModel.fromJson(json)).toList();
    }
    else{
      throw Exception(response.body);
    }
   
   }catch(e){
    throw Exception(e.toString());
   }
  }
}
