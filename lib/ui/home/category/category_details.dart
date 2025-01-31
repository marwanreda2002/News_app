import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:provider/provider.dart';

import 'category_details_view_model.dart';
import 'cubit/source_state.dart';
import 'cubit/soure_view_model_cubit.dart';

class CategoryDetails extends StatefulWidget {
  CategoryCardModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

// todo: MVVM Provider
// CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();
// todo: MVVM Cubit
SourceViewModelCubit viewModel = SourceViewModelCubit();

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewModel.getSources(widget.category);
    //todo: MVVM Provider
    // viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return
        // todo: MVVM cubit
        BlocProvider(
            create: (context) => viewModel,
            child: BlocBuilder<SourceViewModelCubit, SourceState>(
                builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                );
              } else if (state is ErrorState) {
                return Column(children: [
                  Text(state.errorMsg),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.getSources(widget.category);
                    },
                    child: Text("try again"),
                  ),
                ]);
              } else if (state is SuccessState) {
                return SourceTabWidget(sourcesList: state.sourcesList);
              }
              return Container();
            }));

    // todo: MVVM provider
    //   ChangeNotifierProvider<CategoryDetailsViewModel>(
    //   create: (context) => viewModel,
    //   child: Consumer<CategoryDetailsViewModel>(
    //     builder: (context, value, child) {
    //       if (viewModel.errorMsg != null) {
    //         return Column(
    //           children: [
    //             Text(viewModel.errorMsg!),
    //             ElevatedButton(
    //               onPressed: () {
    //                 viewModel.getSources(widget.categoryId);
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       }
    //       if (viewModel.sourcesList == null) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.grey,
    //           ),
    //         );
    //       } else {
    //         return SourceTabWidget(sourcesList: viewModel.sourcesList!);
    //       }
    //     },
    //   ),
    // );

    // todo: without MVVM
    //   FutureBuilder<SourceResponse?>(
    //     future: ApiManager.getSource(widget.categoryId),
    //     builder: (context, snapshot) {
    //       if(snapshot.connectionState==ConnectionState.waiting){
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.grey,
    //           ),
    //         );
    //       }
    //       else if(snapshot.hasError){
    //         return Column(
    //           children: [
    //             Text("something went wrong"),
    //             ElevatedButton(
    //                 onPressed: (){
    //                   ApiManager.getSource(widget.categoryId);
    //                   setState(() {
    //
    //                   });
    //                 },
    //                 child: Text("try again"),
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
    //                 ApiManager.getSource(widget.categoryId);
    //                 setState(() {
    //
    //                 });
    //               },
    //               child: Text("try again"),
    //             ),
    //           ],
    //         );
    //       }
    //       var sourcesList=snapshot.data!.sources!;
    //       return SourceTabWidget(sourcesList: sourcesList);
    //     },
    // );
  }
}
