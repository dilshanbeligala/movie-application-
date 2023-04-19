// import 'package:clean_movie_app_4/features/domain/usecases/get_movies_usecase.dart';
import 'package:clean_movie_app_4/features/data/models/movie_list_model.dart';
import 'package:clean_movie_app_4/features/domain/entities/movie_list_entity.dart';
import 'package:clean_movie_app_4/features/presentation/bloc/movie_list_bloc.dart';
import 'package:clean_movie_app_4/features/presentation/widgets/list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecaces/get_movies_usecase.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({Key? key}) : super(key: key);

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen> {
  bool isLoading = false;
  List<MovieListModel> movies = [];
  final MovieListBloc _bloc = MovieListBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(LoadMovies());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie List'),
      ),
      body: BlocProvider<MovieListBloc>(
        create: (_) => MovieListBloc(),
        child: BlocListener<MovieListBloc, MovieListState>(
          listener: (context, state) {
            if (state is MoviesLoadInProgress) {
              setState(() {
                isLoading = true;
              });
            } else if (state is MoviesLoadSuccess) {
              setState(() {
                isLoading = false;
                movies.addAll(state.generateMovies);
              });
            } else if (state is MoviesLoadFailure) {
              setState(() {
                isLoading = false;
              });
            }
          },
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: movies.isEmpty ? 0 : movies.length,
                  itemBuilder: (context, int index) {
                    return MovieListView(movies: movies[index]);
                  },
                ),
        ),
      ),
    );
  }
}
