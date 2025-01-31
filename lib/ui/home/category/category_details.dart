import 'package:flutter/material.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';
import 'package:provider/provider.dart';

import 'category_details_view_model.dart';

class CategoryDetails extends StatefulWidget {
  String categoryId;

  CategoryDetails({required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

CategoryDetailsViewModel viewModel = CategoryDetailsViewModel();

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryDetailsViewModel>(
      create: (context) => viewModel,
      child: Consumer<CategoryDetailsViewModel>(
        builder: (context, value, child) {
          if (viewModel.errorMsg != null) {
            return Column(
              children: [
                Text(viewModel.errorMsg!),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getSources(widget.categoryId);
                  },
                  child: Text("try again"),
                ),
              ],
            );
          }
          if (viewModel.sourcesList == null) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else {
            return SourceTabWidget(sourcesList: viewModel.sourcesList!);
          }
        },
      ),
    );

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
