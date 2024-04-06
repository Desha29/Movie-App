import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/components/loading_widget.dart';
import '../../../cubit/movies_cubit/movie_cubit.dart';
import '../../../components/exception_widget.dart';
import 'category_row.dart';
import 'movie_row.dart';
import 'movies_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieState>(
      builder: (context, state) {
        if (state is MovieLoadingState) {
          return _HomeLoadingState();
        } else if (state is MovieFailedState) {
          return _HomeFailedState(state.message);
        } else if (state is MovieSuccesState) {
          return _HomeSuccessState(state.nowPlayingMovies, state.upComingMovies,
              state.topRatedMovies, state.popularMovies, state.trendingMovies);
        } else {
          return const ExceptionWidget(
              icon: Icons.error, message: "failed Home body state");
        }
      },
      listener: (BuildContext context, MovieState state) {},
    );
  }

  Widget _HomeSuccessState(nowPlayingMovies, List upComingMovies,
      List topRatedMovies, List popularMovies, List trendingMovies) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        addAutomaticKeepAlives: true,
        addRepaintBoundaries: true,
        addSemanticIndexes: true,
        children: [
          const Text(
            "Trending Movies" + "🔥",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          MovieSlider(
            trendingMovies: trendingMovies,
          ),
          SizedBox(
            height: 60,
            child: CategoryRow(),
          ),
          MovieRow(title: "Upcoming", movies: upComingMovies),
          MovieRow(title: "Now Playing", movies: nowPlayingMovies),
          MovieRow(
            title: "Top Rated",
            movies: topRatedMovies,
          ),
          MovieRow(
            title: "Popular",
            movies: popularMovies,
          ),
        ],
      ),
    );
  }

  Widget _HomeFailedState(String message) =>
      ExceptionWidget(icon: Icons.error, message: message);

  Widget _HomeLoadingState() => const LoadingWidget();
}
