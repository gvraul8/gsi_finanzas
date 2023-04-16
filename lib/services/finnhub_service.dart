import 'dart:convert';

import 'package:gsi_finanzas/models/quote_model.dart';
import 'package:http/http.dart' as http;

class FinnhubService {
  final host = "https://finnhub.io";
  final quoteEndPoint = "/api/v1/quote";
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
        google: "Google",
        netflix: "Netflix",
        paypal: "Paypal",
        santander: "Santander",
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
    return quotes;
  }

  Future<Quote> getQuote(String symbol) async {
    final response = await http
        .get(Uri.parse("$host$quoteEndPoint?symbol=$symbol"), headers: headers);

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      Quote quote = Quote.fromJson(
          json, symbol, symbolsName[symbol]!, symbolsIcon[symbol]!);

      return quote;
    } else {
      throw Exception('Failed to load quote $symbol');
    }
  }
}
