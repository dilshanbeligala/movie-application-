part of 'movie_list_bloc.dart';

abstract class MovieListState extends Equatable {
  const MovieListState();
}

class MoviesInitial extends MovieListState {
  @override
  List<Object> get props => [];
}

class MoviesLoadInProgress extends MovieListState {
  @override
  List<Object> get props => [];
}

class MoviesLoadSuccess extends MovieListState {
  final List<MovieListModel> generateMovies;

  const MoviesLoadSuccess(
    this.generateMovies,
  );

  @override

  List<Object?> get props => [generateMovies];
}

class MoviesLoadFailure extends MovieListState {
  const MoviesLoadFailure();

  @override
  List<Object> get props => [];
}
