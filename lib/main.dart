import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portifolio/utils/routes.dart';
import 'package:portifolio/utils/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: appRoutes(),
      title: 'Portifolio',
      theme: ThemeData(
        textTheme: AppTheme.textTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
    );
  }
}
