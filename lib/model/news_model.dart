class NewsModel{
  String newsId;
  String name;
  String url;

  NewsModel({this.newsId, this.name, this.url});

  NewsModel newsModelFromJson(Map<String,dynamic> json){
    return NewsModel(
      newsId: json['news_id'],
      name: json['name'],
      url: json['url']
    );
  }
}