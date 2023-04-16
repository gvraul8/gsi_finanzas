import 'dart:convert';

import 'package:gsi_finanzas/models/quote_model.dart';
import 'package:http/http.dart' as http;

import '../models/article_model.dart';

class FinnhubService {
  // API COSTANTS
  final api = "https://finnhub.io/api/v1";
  final quoteEndPoint = "/quote";
  final newsEndPoint = "/news";
  final token = "cgrbjlpr01qs9ra1p8j0cgrbjlpr01qs9ra1p8jg";
  Map<String, String> get headers => {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-Finnhub-Token": token,
      };

  // Symbols
  final String amazon = "AMZN";
  final String apple = "AAPL";
  final String tesla = "TSLA";
  final String microsoft = "MSFT";
  final String google = "GOOGL";
  final String netflix = "NFLX";
  final String paypal = "PYPL";
  final String santander = "BCDRF";

  Map<String, String> get symbolsName => {
        amazon: "Amazon.com INC",
        apple: "Apple INC",
        tesla: "Tesla INC",
        microsoft: "Microsoft CORP",
        google: "Alphabet INC-CL A",
        netflix: "Netflix INC",
        paypal: "Paypal Holdings INC",
        santander: "Banco Santander SA",
      };

  Map<String, String> get symbolsIcon => {
        amazon: "amazon.png",
        apple: "apple.png",
        tesla: "tesla.png",
        microsoft: "microsoft.png",
        google: "google.png",
        netflix: "netflix.png",
        paypal: "paypal.png",
        santander: "santander.png",
      };

  Future<List<Quote>> getQuotes() async {
    List<Quote> quotes = [];
    List<String> symbols = [
      amazon,
      apple,
      tesla,
      microsoft,
      google,
      netflix,
      paypal,
      santander
    ];
    for (String symbol in symbols) {
      Quote quote = await getQuote(symbol);
      // Quote quote = Quote(currentPrice: 0.12, change: 0.12, changePercent: 0.12, high: 0.12, low: 0.12, open: 0.12, previousClose: 0.12, symbol: symbol, name: symbolsName[symbol]!, icon: symbolsIcon[symbol]!);
      quotes.add(quote);
    }
    // Order by change percent
    quotes.sort((a, b) => b.changePercent.compareTo(a.changePercent));
    return quotes;
  }

  Future<Quote> getQuote(String symbol) async {
    final response = await http
        .get(Uri.parse("$api$quoteEndPoint?symbol=$symbol"), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Quote quote = Quote.fromJson(
          json, symbol, symbolsName[symbol]!, symbolsIcon[symbol]!);

      return quote;
    } else {
      throw Exception('Failed to load quote $symbol');
    }
  }

  Future<List<Article>> getNews() async {
    final response = await http
        .get(Uri.parse("$api$newsEndPoint?category=general"), headers: headers);

    if (response.statusCode == 200) {
      List<dynamic> json = jsonDecode(response.body);

      List<Article> articles =
          json.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
