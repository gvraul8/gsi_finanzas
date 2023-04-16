class Quote {
  double currentPrice;
  double change;
  double changePercent;
  double high;
  double low;
  double open;
  double previousClose;
  String symbol;
  String name;
  String icon;

  Quote({
    required this.currentPrice,
    required this.change,
    required this.changePercent,
    required this.high,
    required this.low,
    required this.open,
    required this.previousClose,
    required this.symbol,
    required this.name,
    required this.icon,
  });

  factory Quote.fromJson(
      Map<String, dynamic> json, String symbol, String name, String icon) {
    var currentPrice = json['c'] ?? 0.0;
    var change = json['d'] ?? 0.0;
    var changePercent = json['dp'] ?? 0.0;
    var high = json['h'] ?? 0.0;
    var low = json['l'] ?? 0.0;
    var open = json['o'] ?? 0.0;
    var previousClose = json['pc'] ?? 0.0;
    return Quote(
      currentPrice: currentPrice is int ? currentPrice.toDouble(): currentPrice,
      change: change is int ? change.toDouble(): change,
      changePercent: changePercent is int ? changePercent.toDouble(): changePercent,
      high: high is int ? high.toDouble(): high,
      low: low is int ? low.toDouble(): low,
      open: open is int ? open.toDouble(): open,
      previousClose: previousClose is int ? previousClose.toDouble(): previousClose,
      symbol: symbol,
      name: name,
      icon: icon,
    );
  }
}
