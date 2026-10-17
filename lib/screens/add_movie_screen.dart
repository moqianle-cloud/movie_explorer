import 'package:flutter/material.dart';

import '../models/movie.dart';

class AddMovieScreen extends StatefulWidget {
  const AddMovieScreen({super.key});

  @override
  State<AddMovieScreen> createState() => _AddMovieScreenState();
}

class _AddMovieScreenState extends State<AddMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _genreController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _genreController.dispose();
    _imageUrlController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _saveMovie() {
    if (!_formKey.currentState!.validate()) return;
    final title = _titleController.text.trim();
    final imageUrl = _imageUrlController.text.trim().isEmpty
        ? 'https://picsum.photos/seed/${Uri.encodeComponent(title)}/300/450'
        : _imageUrlController.text.trim();
    Navigator.pop(
      context,
      Movie(
        title: title,
        genre: _genreController.text.trim(),
        imageUrl: imageUrl,
        description: _descriptionController.text.trim().isEmpty
            ? 'No description has been added yet.'
            : _descriptionController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Add Movie')),
    body: Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          TextFormField(
            controller: _titleController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Movie title',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Please enter a movie title.'
                : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _genreController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Genre',
              border: OutlineInputBorder(),
            ),
            validator: (value) => value == null || value.trim().isEmpty
                ? 'Please enter a genre.'
                : null,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _imageUrlController,
            keyboardType: TextInputType.url,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              labelText: 'Image URL (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _descriptionController,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: 'Description (optional)',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: _saveMovie,
            icon: const Icon(Icons.save),
            label: const Text('Save Movie'),
          ),
        ],
      ),
    ),
  );
}
