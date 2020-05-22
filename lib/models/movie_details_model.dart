class MovieDetailsModel extends Object {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  MovieDetailsModel(this.id, this.title, this.posterPath, this.overview);

  MovieDetailsModel.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        posterPath = json['poster_path'],
        overview = json['overview'];

  @override
  int get hashCode => id;

  @override
  bool operator ==(dynamic other) => this.id == (other.id);
}
