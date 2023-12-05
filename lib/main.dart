import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main_page.dart';
import 'main_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvider>(
        create: (_) => MainProvider(),
        builder: (context, _){
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: MainPage(),
          );
        });
  }
}

