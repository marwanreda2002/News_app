import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/category/source_tab_widget.dart';

import '../../../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  const CategoryDetails({super.key});

  static const String routeName="category details";

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManager.getSource(),
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text("something went wrong"),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getSource();
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
                    ApiManager.getSource();
                    setState(() {

                    });
                  },
                  child: Text("try again"),
                ),
              ],
            );
          }
          var sourcesList=snapshot.data!.sources!;
          return SourceTabWidget(sourcesList: sourcesList);
        },
    );
  }
}
