import 'package:flutter/material.dart';
import 'package:search_image/data/photo_provider.dart';
import 'package:search_image/data/pixabay_api.dart';
import 'package:search_image/ui/home_screen.dart';
import 'package:search_image/ui/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Inherited Wiget으로 감싸준다.
      home: PhotoProvider(
        viewModel: HomeViewModel(PixabayApi()),
        child: const HomeScreen(),
      ),
    );
  }
}
