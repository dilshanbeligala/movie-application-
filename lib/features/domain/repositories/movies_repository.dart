import 'package:dartz/dartz.dart';
import '../../../core/failures/failures.dart';
import '../../data/models/movie_list_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, List<MovieListModel>>> getMovies();
}