import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key,required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var screenHeight=852;
    var screenWidth=393;
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id??""),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(
                  onPressed: (){
                    ApiManager.getNewsBySourceId(widget.source.id??"");
                    setState(() {
                    });
                  },
                  child: Text("try again"),
                ),
              ],
            );
          }
          if(snapshot.data!.status=="error"){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  onPressed: (){
                    ApiManager.getNewsBySourceId(widget.source.id??"");
                    setState(() {
                    });
                  },
                  child: Text("try again"),
                ),
              ],
            );
          }
          var newsList=snapshot.data!.articles;
          return ListView.builder(
            itemBuilder: (context, index) {
            return NewsItem(news: newsList[index]);
          },
            itemCount: newsList!.length,
          );
        },
    );
  }
}
