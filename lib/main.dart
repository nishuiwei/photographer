import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photographer/pages/bottom_navigation_page.dart';

void main() => {runApp(const GetMaterialApp(home: MyApp()))};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '摄友APP',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
          )),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BottomNavigationPage(),
    );
  }
}
