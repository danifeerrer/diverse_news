import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final Map<String, dynamic> newsItem;

  const NewsDetailPage({Key? key, required this.newsItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsItem['title'] ?? 'News Detail'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              newsItem['title'] ?? '',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              newsItem['abstract'] ?? '',
              style: TextStyle(fontSize: 18.0, color: Colors.grey[300]),
            ),
            SizedBox(height: 24.0),
            Text(
              "Full Article",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 8.0),
            Text(
              newsItem['url'] ?? '',
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
            SizedBox(height: 24.0),
            Text(
              "Published Date: ${newsItem['published_date'] ?? 'Unknown'}",
              style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.grey[300]),
            ),
          ],
        ),
      ),
    );
  }
}