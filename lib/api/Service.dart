import 'package:global_news/api/endpoints.dart';
import 'package:global_news/model/news_model.dart';
import 'dart:convert' show json, utf8;
import 'package:http/http.dart' as http;

class NewsApi {
  Future<List<Articles>> getArticles() async {
    var response = await http.get(Uri.parse('${Endpoints.DOMAIN}'));
    if (response.statusCode == 200) {
      var articles = json.decode(utf8.decode(response.bodyBytes));
      print(articles);
      return articles['data']
          ?.map<Articles>((a) => Articles.fromJson(a))
          ?.toList();
    } else {
      throw Exception();
    }
  }
}
