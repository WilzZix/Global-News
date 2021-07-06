import 'package:global_news/api/endpoints.dart';
import 'package:global_news/model/news_model.dart';
import 'dart:convert' show json, utf8;
import 'package:http/http.dart' as http;
import 'package:convert/convert.dart';

class NewsApi {
  Future<Articles> getArticles() async {
    var response = await http.get(Uri.parse('${Endpoints.DOMAIN}'));
    var articles = json.decode(utf8.decode(response.bodyBytes));
    return articles['articles']
        ?.map<Articles>((a) => Articles.fromJson(a))
        ?.toList();
  }
}
