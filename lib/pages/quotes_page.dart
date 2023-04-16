import 'package:flutter/material.dart';
import 'package:gsi_finanzas/models/quote_model.dart';
import 'package:gsi_finanzas/services/finnhub_service.dart';

import '../components/quotes_list_tile.dart';

class QuotesPage extends StatelessWidget {
  FinnhubService client = FinnhubService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF020060),
          title: const Text('Precios'),
        ),
        body: FutureBuilder(
          future: client.getQuotes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Quote>> snapshot) {
            if(snapshot.hasData){
              List<Quote>? quotes = snapshot.data;
              return ListView.builder(
                  itemCount: quotes?.length,
                  itemBuilder: (context, index) => QuotesListTile(quotes![index], context)
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}