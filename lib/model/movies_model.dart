class Movies {
  final String title;
  final String overview;
  final String language;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final int voteCount;
  final int id;
  final double voteAverage;

  Movies(
      {required this.releaseDate,
      required this.id,
      required this.voteAverage,
      required this.language,
      required this.title,
      required this.overview,
      required this.posterPath,
      required this.backdropPath,
      required this.voteCount});

  static List<Movies> convertToMovies(List movies) {
    List<Movies> moviesList = [];
    for (var movie in movies) {
      if (movie["title"] == null ||
          movie["overview"] == null ||
          movie["backdrop_path"] == null ||
          movie["poster_path"] == null ||
          movie["vote_count"] == null ||
          movie["original_language"] == null ||
          movie["vote_average"] == null ||
          movie["release_date"] == null) {
        continue;
      }
      moviesList.add(Movies(
          id: movie["id"],
          title: movie["title"],
          overview: movie["overview"],
          language: movie["original_language"],
          posterPath: movie["poster_path"],
          releaseDate: movie["release_date"],
          backdropPath: movie["backdrop_path"],
          voteCount: movie["vote_count"],
          voteAverage: movie["vote_average"]));
    }
    return moviesList;
  }
}

class Casts {
  final String profilePath;

  Casts({required this.profilePath});
  static List<Casts> convertToCasts(List casts) {
    List<Casts> castList = [];
    for (var cast in casts) {
      if (cast["profile_path"] == null) {
        continue;
      }
      castList.add(Casts(profilePath: cast["profile_path"]));
    }
    return castList;
  }
}
class Videos {
  final String videokey;

  Videos({required this.videokey} );

  static List<Videos> convertToVideos(List videos) {
    List<Videos>  videoList = [];
    for (var video in videos) {
      if (video["key"] == null) {
        continue;
      }
      videoList.add(Videos(videokey: video["key"]));
    }
    return videoList;
  }
}
