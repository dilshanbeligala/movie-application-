class MovieListModel {
  final String? title;
  final String? year;
  final String? poster;

  MovieListModel({this.title, this.year, this.poster});

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      title: json['title'],
      year: json['year'],
      poster: json['poster'],
    );
  }
}
