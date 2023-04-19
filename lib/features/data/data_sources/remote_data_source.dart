import 'package:dio/dio.dart';
import '../models/movie_list_model.dart';

class RemoteDataSourse {
  final Dio _dio;

  RemoteDataSourse(this._dio);

//my code
  Future<List<MovieListModel>> getMovies() async {
    final response =
        await _dio.get('http://www.omdbapi.com/?apikey=38f4414c&s=avengers');

    if (response.statusCode == 200) {
      final data = response.data;
      final movieList =
          data.map((json) => MovieListModel.fromJson(json)).toList();

      return (movieList);
    } else {
      throw Exception('Failed to load users');
    }
//mycode
  }
}
