import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchNews() async {
  String apiKey = 'e16ab044a2454a15a90bd696e21bec68';
  String category = 'sports';

  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=$category&sortBy=popularity&apiKey=$apiKey'),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> articles = data['articles'];
    final cleanedData = articles.where((item) {
    return !item.containsValue(null) && !item.containsValue("[Removed]");
  }).toList();
    return cleanedData;
  } else {
    throw Exception('Failed to load news');
  }
}

Future<List<dynamic>> fetchSpecificNews(search) async {
  String apiKey = 'e16ab044a2454a15a90bd696e21bec68';
  
  final response = await http.get(
    Uri.parse('https://newsapi.org/v2/everything?q=$search&searchIn=title&language=en&apiKey=$apiKey'),
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    List<dynamic> articles = data['articles'];
    final cleanedData = articles.where((item) {
      return !item.containsValue(null) && !item.containsValue("[Removed]");
    }).toList();
    return cleanedData;
  } else {
    throw Exception('Failed to load news');
  }
}
