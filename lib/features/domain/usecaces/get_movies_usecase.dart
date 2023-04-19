import 'package:clean_movie_app_4/features/data/data_sources/remote_data_source.dart';
import 'package:clean_movie_app_4/features/data/repository/movies_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import '../../../core/failures/failures.dart';
import '../../data/models/movie_list_model.dart';
import '../repositories/movies_repository.dart';

class GetMoviesUseCase {
  MoviesRepositoryImpl moviesRepository =
      MoviesRepositoryImpl(RemoteDataSourse(Dio()));

  Future<Either<Failure, List<MovieListModel>>> call() {
    return moviesRepository.getMovies();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

//failure dala na