import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/features/Data/data_source/remote/news_api_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: NewsApiService().getNewsArticals(),
        builder: (context, snapshot) {
          final data=snapshot.data;
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(title: Text(snapshot.data![index].title!));
              },
              itemCount: snapshot.data!.length,
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
