import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/Data/data_source/remote/news_api_service.dart';
import 'package:flutter_clean_architecture/features/Data/models/articale_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ArticleModel>>(
  future: NewsApiService().getNewsArticals(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }

    if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    }

    if (!snapshot.hasData || snapshot.data!.isEmpty) {
      return Center(child: Text('No news found'));
    }

    final articles = snapshot.data!;

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];

        return ListTile(
          leading: Image.network(article.imageUrl ?? ''),
          title: Text(article.title ?? 'No title'),
          subtitle: Text( '${article.author} this is auther'),
        
        );
      },
    );
  },
)
    );
  }
}
