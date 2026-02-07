import 'dart:convert';

import 'package:flutter_clean_architecture/core/constaant/constant.dart';

import 'package:retrofit/retrofit.dart';
import 'package:http/http.dart' as http;
import '../../models/articale_model.dart';

@RestApi(baseUrl: newsApiBaseURL)
class NewsApiService {
  //factory NewsApiService(Dio dio,) = _NewsApiService;

  Future<List<ArticleModel>> getNewsArticals() async {
    try {
      final uri = Uri.parse(
        newsApiBaseURL,
      ).replace(queryParameters: {'country': country, 'category': category});

      final response = await http.get(uri, headers: {'X-Api-Key': newsApiKey});
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);
        final news = NewsResponseModel.fromJson(decoded);
        return news.articles;
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
