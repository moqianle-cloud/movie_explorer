import 'package:flutter/material.dart';

import '../models/movie.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({super.key, required this.movie, required this.onTap});
  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Card(
    clipBehavior: Clip.antiAlias,
    child: ListTile(
      contentPadding: const EdgeInsets.all(10),
      leading: SizedBox(
        width: 58,
        height: 78,
        child: Image.network(
          movie.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => const ColoredBox(
            color: Colors.deepPurple,
            child: Center(child: Icon(Icons.movie, color: Colors.white)),
          ),
        ),
      ),
      title: Text(
        movie.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(movie.genre),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    ),
  );
}
