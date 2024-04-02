import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movies_cubit/movie_cubit.dart';
import 'package:movie_app/cubit/movies_cubit/search_cubit/search_states.dart';
import 'package:movie_app/data/api/get_movies.dart';

import '../../../model/movies_model.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit()
      : super(SearchInitialState(popularMoviesList: MovieCubit.popularMovies));
  static List<Movies> result = [];

  Future<void> getResultSearch({required String searchText}) async {
    if (searchText.isEmpty) {
      emit(SearchInitialState(popularMoviesList: MovieCubit.popularMovies));
    } else {
      try {
        await search(searchText);
        emit(SearchSuccessfullyState(searchResult: result));
      } catch (e) {
        emit(SearchFailedState(message: "get video error"));
      }
    }
  }

  Future<void> search(String query) async {
    DioHelper.searchText = query;
    List resultList = await DioHelper().getSearchedMovie();
    result = Movies.convertToMovies(resultList);
  }
}
