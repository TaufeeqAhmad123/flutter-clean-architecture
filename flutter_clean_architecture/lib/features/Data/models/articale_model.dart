import 'package:flutter_clean_architecture/features/Domain/entites/artical.dart';

class ArticaleModel extends ArticalEntities{
  const  ArticaleModel({
    final int? id,
    final String? author,
    final String? title,
    final String? description,
    final String? url,
    final String? urlToImage,
    final String? publishedAt,
    final String? content,
  }) ;

  factory ArticaleModel.fromJson(Map<String, dynamic> json){
    return ArticaleModel(
      id: json['id'],
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
    );
  }

}