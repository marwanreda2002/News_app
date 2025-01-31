import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/ui/home/category/source_name_item.dart';
import 'package:news/ui/home/news/news_widget.dart';

class SourceTabWidget extends StatefulWidget {
  SourceTabWidget({super.key,required this.sourcesList});
  List<Source> sourcesList;

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex=0;

  // NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sourcesList.length,
        child: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              onTap: (value) {
                selectedIndex=value;
                setState(() {

                });
              },
              indicatorColor: Theme.of(context).indicatorColor,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: widget.sourcesList.map((source){
                return SourceNameItem(
                    source: source,
                    isSelected: selectedIndex==widget.sourcesList.indexOf(source),);
              }).toList(),
            ),
            Expanded(
                child:NewsWidget(source: widget.sourcesList[selectedIndex]),
            ),
          ],
        )
    );
  }
}
