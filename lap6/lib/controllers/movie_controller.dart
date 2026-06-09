import '../models/movie.dart';

class MovieController {
  List<Movie> filterAndSortMovies({
    required List<Movie> movies,
    required String searchQuery,
    required Set<String> selectedGenres,
    required String sortType,
  }) {
    List<Movie> result = movies.where((movie) {
      bool searchMatch = movie.title
          .toLowerCase()
          .contains(searchQuery.toLowerCase());

      bool genreMatch = selectedGenres.isEmpty ||
          movie.genres.any(
                (genre) => selectedGenres.contains(genre),
          );

      return searchMatch && genreMatch;
    }).toList();

    switch (sortType) {
      case 'A-Z':
        result.sort(
                (a, b) => a.title.compareTo(b.title));
        break;

      case 'Z-A':
        result.sort(
                (a, b) => b.title.compareTo(a.title));
        break;

      case 'Year':
        result.sort(
                (a, b) => b.year.compareTo(a.year));
        break;

      case 'Rating':
        result.sort(
                (a, b) => b.rating.compareTo(a.rating));
        break;
    }

    return result;
  }
}