import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category_card_model.dart';
import 'package:news/ui/home/category/category_details.dart';
import 'package:news/ui/home/category/category_view.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName="home screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiManager apiManager = ApiManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        backgroundColor: Colors.black,
        child: HomeDrawer(
          onGoToHomeClicked: onGoToHomeClicked,
        ),
      ),
      appBar: AppBar(
        title: Text(
          selectedCategoryId == null ? "Home" : selectedCategoryId!.title,
          style: Theme.of(context).textTheme.headlineLarge ,
        ),
      ),
      body: selectedCategoryId == null
          ? CategoryView(
              onViewAllClicked: onViewAllClicked,
            )
          : CategoryDetails(
              category: selectedCategoryId!,
            ),
    );
  }

  CategoryCardModel? selectedCategoryId;

  onViewAllClicked(CategoryCardModel newSelectedCategoryId) {
    apiManager.getSource(newSelectedCategoryId);
    selectedCategoryId = newSelectedCategoryId;
    setState(() {});
  }

  void onGoToHomeClicked() {
    selectedCategoryId = null;
    setState(() {});
  }
}
