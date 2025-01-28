import 'package:flutter/material.dart';
import 'package:news/ui/home/category/category_details.dart';
import 'package:news/ui/home/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName="home screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        backgroundColor: Colors.black,
        child: HomeDrawer(),
      ),
      appBar: AppBar(
        title: Text("Home",
          style: Theme.of(context).textTheme.headlineLarge ,
        ),
      ),
      body:  CategoryDetails(),
    );
  }
}
