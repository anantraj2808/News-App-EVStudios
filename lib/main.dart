import 'package:flutter/material.dart';
import 'package:news_app_ev/presentation/news_listing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: NewsListingPage(),
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
    );
  }
}
