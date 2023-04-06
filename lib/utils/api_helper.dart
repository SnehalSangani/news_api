import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_api/screen/home/model/news_model.dart';
import 'package:news_api/screen/home/provider/news_provider.dart';

class Apihelper
{
  Future<Newsmodel> Newsapicall()
  async {
    String newslink="https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=ba0426f965084e58833c7f8eec9edc4d";
    Uri uri=Uri.parse(newslink);
    var response=await http.get(uri);

    var json=jsonDecode(response.body);

    Newsmodel n1 = Newsmodel().newsfromjson(json);
    return n1;
  }
}