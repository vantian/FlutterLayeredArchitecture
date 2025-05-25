import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layered_architecture/core/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Use GetMaterialApp to enable GetX features
    return GetMaterialApp(
      title: 'Vantian Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/joke',
      getPages: AppRoutes.routes,
    );
  }
}
