import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app_ev/model/news_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsFetcherService{

  Future<List<NewsModel>> getNews() async {

    List<NewsModel> newsList = [];

    String url = "https://hubblesite.org/api/v3/news";
    final http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      for(int i=0 ; i<data.length ; i++){
        newsList.add(NewsModel().newsModelFromJson(data[i]));
      }
    }
    else{
      Fluttertoast.showToast(
          msg: "Something went wrong :(",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

    return newsList;
  }
}