import 'package:flutter/material.dart';
import 'package:gsi_finanzas/components/custom_list_tile.dart';
import 'package:gsi_finanzas/services/api_services.dart';

import '../models/article_model.dart';

class NewsPage extends StatelessWidget {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF020060),
          title: const Text('Noticias'),
        ),
        body: FutureBuilder(
          future: client.getArticles(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if(snapshot.hasData){
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (context, index) => customListTile(articles![index], context)
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
