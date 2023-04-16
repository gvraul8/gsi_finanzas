
class Article{
  String source;
  String headline;
  String summary;
  String url;
  String image;

  Article({
    required this.source,
    required this.headline,
    required this.summary,
    required this.url,
    required this.image,
  });

  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
      source: json['source'],
      headline: json['headline'],
      summary: json['summary'],
      url: json['url'],
      image: json['image'],
    );
  }
}
