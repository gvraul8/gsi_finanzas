import 'package:flutter/material.dart';
import 'package:gsi_finanzas/components/news_list_tile.dart';
import 'package:gsi_finanzas/services/finnhub_service.dart';

import '../models/article_model.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    FinnhubService client = FinnhubService();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF020060),
          title: const Text('Noticias'),
        ),
        body: FutureBuilder(
          future: client.getNews(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
            if (snapshot.hasData) {
              List<Article>? articles = snapshot.data;
              return ListView.builder(
                  itemCount: articles?.length,
                  itemBuilder: (context, index) =>
                      NewsListTile(articles![index], context));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
