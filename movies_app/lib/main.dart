import 'package:flutter/material.dart';
import 'package:movies_app/models/movie_entity.dart';

import 'data/movies.json.dart';
import 'intro/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MovieEntity> movies = moviesJSON.map((e) => MovieEntity.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroPage(),
    );
  }
}
