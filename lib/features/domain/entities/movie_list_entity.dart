import 'package:equatable/equatable.dart';

class MovieListEntity extends Equatable
{
  final String title;
  final double year;
  final String poster;

  const MovieListEntity({
    required this.title,
    required this.year,
    required this.poster,
  });

  @override
  List<Object?> get props => [
    title,
    year,
    poster
  ];

  @override
  bool get stringify => true;
}