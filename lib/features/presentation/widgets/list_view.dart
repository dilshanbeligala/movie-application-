import 'package:clean_movie_app_4/features/data/models/movie_list_model.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/movie_list_entity.dart';

class MovieListView extends StatefulWidget {
  final MovieListModel movies;
  const MovieListView({Key? key, required this.movies}) : super(key: key);

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(widget.movies.title!),
    );
  }
}
