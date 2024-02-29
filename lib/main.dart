import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_project/Controller/DependencyInjection.dart';
import 'UserListScreens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const UserListScreen(),
    );
  }

  @override
  void initState() {
    super.initState();
    DependencyInjection.init();
  }
}

