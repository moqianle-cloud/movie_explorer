import 'package:flutter/material.dart';

import '../data/sample_movies.dart';
import '../models/movie.dart';
import '../widgets/movie_list_item.dart';
import 'add_movie_screen.dart';
import 'movie_detail_screen.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  final List<Movie> _movies = List.of(sampleMovies);

  Future<void> _openAddMovieScreen() async {
    final newMovie = await Navigator.push<Movie>(
      context,
      MaterialPageRoute(builder: (context) => const AddMovieScreen()),
    );
    if (newMovie != null && mounted) {
      setState(() => _movies.insert(0, newMovie));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${newMovie.title} added to your list.')),
      );
    }
  }

  void _openMovieDetails(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie)),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Movie Explorer')),
    body: ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: _movies.length,
      itemBuilder: (context, index) => MovieListItem(
        movie: _movies[index],
        onTap: () => _openMovieDetails(_movies[index]),
      ),
    ),
    floatingActionButton: FloatingActionButton.extended(
      onPressed: _openAddMovieScreen,
      icon: const Icon(Icons.add),
      label: const Text('Add movie'),
    ),
  );
}
