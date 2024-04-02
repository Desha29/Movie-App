abstract class SearchStates {}

final class SearchInitialState extends SearchStates {
  final List popularMoviesList;

  SearchInitialState({required this.popularMoviesList});
}

final class SearchSuccessfullyState extends SearchStates {
  final List searchResult;

  SearchSuccessfullyState({required this.searchResult});
}

final class SearchFailedState extends SearchStates {
  final String message;

  SearchFailedState({required this.message});
}
