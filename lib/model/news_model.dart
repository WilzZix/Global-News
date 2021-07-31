class NewsModel {
  String _status;
  int _totalResults;
  List<Articles> _articles;

  String get status => _status;

  int get totalResults => _totalResults;

  List<Articles> get articles => _articles;

  NewsModel({String status, int totalResults, List<Articles> articles}) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  NewsModel.fromJson(dynamic json) {
    _status = json["status"];
    _totalResults = json["totalResults"];
    if (json["articles"] != null) {
      _articles = [];
      json["articles"].forEach((v) {
        _articles.add(Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["totalResults"] = _totalResults;
    if (_articles != null) {
      map["articles"] = _articles.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":null,"name":"TweakTown"}
/// author : "Anthony Garreffa"
/// title : "Elon Musk says Starlink will offer internet globally by August"
/// description : "Tesla and SpaceX founder Elon Musk says Starlink internet will offer global coverage by August, apart from the South, North Poles. Continue reading at TweakTown >"
/// url : "https://www.tweaktown.com/news/80313/elon-musk-says-starlink-will-offer-internet-globally-by-august/index.html"
/// urlToImage : "https://static.tweaktown.com/news/8/0/80313_08_elon-musk-says-starlink-will-offer-internet-globally-by-august_full.jpg"
/// publishedAt : "2021-07-01T02:11:02Z"
/// content : "SpaceX will have its ambitious Starlink satellite internet service available globally in August 2021, just over a month from now -- globally, apart from the North and South Poles.\r\nThe news comes fro… [+1060 chars]"

class Articles {
  Source _source;
  String _author;
  String _title;
  String _description;
  String _url;
  String image;
  String country;
  String language;
  String _category;
  String _publishedAt;
  String _content;

  Source get source => _source;

  String get author => _author;

  String get category => _category;

  String get title => _title;

  String get description => _description;

  String get url => _url;

  String get urlToImage => image;

  String get publishedAt => _publishedAt;

  String get content => _content;

  Articles(
      {Source source,
      String author,
      String title,
      String category,
      String description,
      String url,
      String urlToImage,
      String publishedAt,
      String content}) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _category = category;
    image = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Articles.fromJson(dynamic json) {
    _source = json["source"] != null ? Source.fromJson(json["source"]) : null;
    _author = json["author"];
    _title = json["title"];
    _description = json["description"];
    _url = json["url"];
    _category = json['category'];
    image = json['urlToImage'];
    //image = json["image"];
    _publishedAt = json["published_at"];
    _content = json["content"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_source != null) {
      map["source"] = _source.toJson();
    }
    map["author"] = _author;
    map["title"] = _title;
    map['category'] = _category;
    map["description"] = _description;
    map["url"] = _url;
    map["image"] = image;
    map["published_at"] = _publishedAt;
    map["content"] = _content;
    return map;
  }
}

/// id : null
/// name : "TweakTown"

class Source {
  dynamic _id;
  String _name;

  dynamic get id => _id;

  String get name => _name;

  Source({dynamic id, String name}) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    return map;
  }
}
