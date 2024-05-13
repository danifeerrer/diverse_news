import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'news_detail_page.dart'; // Import NewsDetailPage

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Map<String, dynamic>>> _news;

  @override
  void initState() {
    super.initState();
    _news = fetchNews('nyt', 'world'); // Puedes cambiar 'nyt' y 'world' según tus preferencias
  }

  Future<List<Map<String, dynamic>>> fetchNews(String source, String section) async {
    final response = await http.get(Uri.parse('https://api.nytimes.com/svc/news/v3/content/$source/$section.json?api-key=weasKgAoVd2aatAV5uk53zYn6Zotqkfv'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  bool containsKeyword(Map<String, dynamic> newsItem) {
    final String title = newsItem['title']?.toString().toLowerCase() ?? '';
    return title.contains('gaza');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _news,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final List<Map<String, dynamic>> filteredNews = snapshot.data!.where(containsKeyword).toList();
            return ListView.builder(
              itemCount: filteredNews.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> newsItem = filteredNews[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  elevation: 4.0,
                  child: ListTile(
                    title: Text(
                      newsItem['title'] ?? '',
                      style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailPage(newsItem: newsItem),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
