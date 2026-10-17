/// Represents one movie displayed by the app.
class Movie {
  final String title;
  final String genre;
  final String imageUrl;
  final String description;

  const Movie({
    required this.title,
    required this.genre,
    required this.imageUrl,
    required this.description,
  });
}
