import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../../domain/repositories/movies_repository.dart';
import '../data_sources/remote_data_source.dart';
import '../models/movie_list_model.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  late final RemoteDataSourse remoteDataSourse;

  MoviesRepositoryImpl(this.remoteDataSourse);

  @override
  Future<Either<Failure, List<MovieListModel>>> getMovies() async {
    try {
      final List<MovieListModel> movieList = await remoteDataSourse.getMovies();
      return Right(movieList);
    } catch (e) {
      print(e.toString());
      throw Left(Exception('Something Went Wrong'));
    }
  }
}
