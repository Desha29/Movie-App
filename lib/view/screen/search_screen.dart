import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie_app/cubit/movies_cubit/search_cubit/search_cubit.dart';
import 'package:movie_app/cubit/movies_cubit/search_cubit/search_states.dart';
import '../../components/components.dart';
import '../../components/constant/api_constants.dart';
import '../../components/constant/imageassets.dart';
import '../../components/constant/routes.dart';
import '../../components/exception_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onChanged: (value) {
                  if (value.isEmpty) {
                  } else {
                    context
                        .read<SearchCubit>()
                        .getResultSearch(searchText: value);
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                if (state is SearchInitialState) {
                  return searchSuccessState(state.popularMoviesList);
                } else if (state is SearchSuccessfullyState) {
                  return searchSuccessState(state.searchResult);
                }
                return searchFailedState("No Data");
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget searchFailedState(String message) =>
    ExceptionWidget(icon: Icons.error, message: message);
@override
Widget searchSuccessState(List result) => GridView.builder(
    physics: BouncingScrollPhysics(),
    addAutomaticKeepAlives: true,
    itemCount: result.length,
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 20),
    itemBuilder: (context, index) {
      return Container(
        child: InkWell(
          onTap: () async {
            navigateTo(context, AppRoutes.moviepage,
                arguments: [index, result]);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                ApiConstants.imageUrl + result[index].posterPath,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(AppImageAssets.noImage);
                },
              ),
            ),
          ),
        ),
      );
    });
