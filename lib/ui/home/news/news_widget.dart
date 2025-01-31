import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:news/utils/app_colors.dart';
import 'package:provider/provider.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(
        builder: (context, value, child) {
          if (value.errorMsg != null) {
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(widget.source.id ?? "");
                  },
                  child: Text("try again"),
                ),
              ],
            );
          } else if (value.newsList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: viewModel.newsList![index]);
              },
              itemCount: viewModel.newsList!.length,
            );
          }
        },
      ),
    );

    //   FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id??""),
    //     builder: (context, snapshot) {
    //       if(snapshot.connectionState==ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       }
    //       else if(snapshot.hasError){
    //         return Column(
    //           children: [
    //             Text("something went wrong"),
    //             ElevatedButton(
    //               onPressed: (){
    //                 ApiManager.getNewsBySourceId(widget.source.id??"");
    //                 setState(() {
    //                 });
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       }
    //       if(snapshot.data!.status=="error"){
    //         return Column(
    //           children: [
    //             Text(snapshot.data!.message!),
    //             ElevatedButton(
    //               onPressed: (){
    //                 ApiManager.getNewsBySourceId(widget.source.id??"");
    //                 setState(() {
    //                 });
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       }
    //       var newsList=snapshot.data!.articles;
    //       return ListView.builder(
    //         itemBuilder: (context, index) {
    //         return NewsItem(news: newsList[index]);
    //       },
    //         itemCount: newsList!.length,
    //       );
    //     },
    // );
  }
}
