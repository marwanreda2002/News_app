import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/ui/home/home_screen.dart';
import 'package:news/utils/app_themes.dart';
import 'package:news/utils/myb_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:HomeScreen.routeName ,
      routes: {
        HomeScreen.routeName:(_)=>HomeScreen(),

      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

