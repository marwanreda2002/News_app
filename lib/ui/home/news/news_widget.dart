import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/news/cubit/news_view_model_cubit.dart';
import 'package:news/ui/home/news/news_item.dart';
import 'package:news/utils/app_colors.dart';

import 'cubit/news_state.dart';

class NewsWidget extends StatefulWidget {
  NewsWidget({super.key, required this.source});

  Source source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  // TODO: MVVM provider
  // NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  // TODO MVVM Cubit
  NewsViewModelCubit viewModel = NewsViewModelCubit();
  @override
  void initState() {
    // TODO: MVVM cubit
    viewModel.getNewsBySourceId(widget.source.id ?? "");
    // TODO: MVVM provider
    // viewModel.getNewsBySourceId(widget.source.id ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return
        // TODO: MVVM cubit
        BlocProvider(
      create: (context) => viewModel,
      child: BlocBuilder<NewsViewModelCubit, NewsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.greyColor,
              ),
            );
          } else if (state is ErrorState) {
            return Column(
              children: [
                Text(state.errorMsg),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Try again"),
                ),
              ],
            );
          } else if (state is SuccessState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return NewsItem(news: state.newsList[index]);
              },
              itemCount: state.newsList.length,
            );
          }
          return Container();
        },
      ),
    );

    // TODO: MVVM provider
    //   ChangeNotifierProvider(
    //   create: (context) => viewModel,
    //   child: Consumer<NewsWidgetViewModel>(
    //     builder: (context, value, child) {
    //       if (value.errorMsg != null) {
    //         return Column(
    //           children: [
    //             Text("something went wrong"),
    //             ElevatedButton(
    //               onPressed: () {
    //                 viewModel.getNewsBySourceId(widget.source.id ?? "");
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       } else if (value.newsList == null) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: AppColors.greyColor,
    //           ),
    //         );
    //       } else {
    //         return ListView.builder(
    //           itemBuilder: (context, index) {
    //             return NewsItem(news: viewModel.newsList![index]);
    //           },
    //           itemCount: viewModel.newsList!.length,
    //         );
    //       }
    //     },
    //   ),
    // );

    // TODO: without MVVM
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
