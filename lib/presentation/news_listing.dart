import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app_ev/model/news_model.dart';
import 'package:news_app_ev/presentation/web_wiew.dart';
import 'package:news_app_ev/service/news_service.dart';

class NewsListingPage extends StatefulWidget {
  @override
  _NewsListingPageState createState() => _NewsListingPageState();
}

class _NewsListingPageState extends State<NewsListingPage> {

  List<NewsModel> newsList = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    fetchNewsRequest();
  }

  fetchNewsRequest() async {
    setState(() {
      isLoading = true;
    });
    await NewsFetcherService().getNews().then((value){
      newsList = value;
    });
    setState(() {
      isLoading = false;
    });
  }

  Widget newsTile(NewsModel newsItem, int index){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewPage(url: newsItem.url, id: newsItem.newsId,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(color: Colors.blue),
          color: Colors.white,
        ),
        height: 75.0,
        child: ListTile(
          leading: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 24.0,
                width: 24.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue
                ),
                child: Center(
                  child: Text((index+1).toString(),style: TextStyle(color: Colors.white,fontSize: 16.0),),
                ),
              ),
            ],
          ),
          title: Text(newsItem.name,style: TextStyle(color: Colors.black,fontSize: 16.0,fontFamily: "GoogleSans",),maxLines: 3,overflow: TextOverflow.ellipsis,),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News",style: TextStyle(
                color: Colors.black
            ),),
            Text("App",style: TextStyle(
                color: Colors.blue
            ),)
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: isLoading ? Center(child: CircularProgressIndicator()) : Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
          child: ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context,index){
              return Container(
                margin: EdgeInsets.only(top: 4),
                  child: newsTile(newsList[index],index));
            },
          ),
        ),
      ),
    );
  }
}
