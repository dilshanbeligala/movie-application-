import 'package:clean_movie_app_4/features/data/models/movie_list_model.dart';
import 'package:clean_movie_app_4/features/domain/repositories/movies_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecaces/get_movies_usecase.dart';
part 'movie_list_event.dart';
part 'movie_list_state.dart';

class MovieListBloc extends Bloc<MovieListEvent, MovieListState> {
  GetMoviesUseCase getMoviesUseCase = GetMoviesUseCase();

  MovieListBloc() : super(MoviesInitial()) {
    on<LoadMovies>((event, emit) async {
      emit(MoviesLoadInProgress());
      final result = await getMoviesUseCase();
      emit(result.fold(
        (failure) => const MoviesLoadFailure(),
        (movies) => MoviesLoadSuccess(movies),
      ));
    });
  }
}
