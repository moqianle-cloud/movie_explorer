import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Movie Details')),
    body: SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: AspectRatio(
              aspectRatio: 2 / 3,
              child: Image.network(
                movie.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const ColoredBox(
                  color: Colors.deepPurple,
                  child: Center(
                    child: Icon(Icons.movie, color: Colors.white, size: 80),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(movie.title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(
            'Genre: ${movie.genre}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          Text(movie.description, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    ),
  );
}
