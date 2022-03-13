import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sales_erb/screens.dart';
import 'package:sales_erb/screens/home-screen/home_screen.dart';
import 'package:sales_erb/screens/main-page/main_page.dart';
import 'package:sales_erb/utils/theme.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sales',
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: MainPage(menuScreenContext: context),
      routes: const {
        // HomeScreen.routName: (_) => HomeScreen(),
        // ProductsScreen.routName: (_) => ProductsScreen(),
      },
    );
  }
}
