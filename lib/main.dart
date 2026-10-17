import 'package:flutter/material.dart';

import 'screens/movie_list_screen.dart';

void main() => runApp(const MovieExplorerApp());

class MovieExplorerApp extends StatelessWidget {
  const MovieExplorerApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Movie Explorer',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const MovieListScreen(),
  );
}
