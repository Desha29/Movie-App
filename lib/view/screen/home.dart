import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/moviesdata_controlletr.dart';
import '../../core/constant/routes.dart';
import '../widget/home/category_row.dart';
import '../widget/home/drawer_column.dart';
import '../widget/home/movie_row.dart';
import '../widget/home/movies_slider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getMovies() async {
    await MoviesData().getData();
    setState(() {});
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getMovies();
  }

  List<String> CategoryNames = [
    "Action",
    "Drama",
    "Comedy",
    "Horror",
    "Romance",
    "Cartoon"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Color.fromARGB(240, 35, 35, 35),
          child: DrawerColumn(),
        ),
        appBar: AppBar(
            iconTheme: const IconThemeData(size: 30, color: Colors.white70),
            actions: [
              SizedBox(width: 10),
              InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.searchPage);
                  },
                  child: const Icon(
                    Icons.search,
                  )),
              SizedBox(width: 10),
              InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.notifications_none_rounded,
                  )),
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            physics: BouncingScrollPhysics(),
            addAutomaticKeepAlives: true,
            addRepaintBoundaries: true,
            addSemanticIndexes: true,
            children: [
              const Text(
                "Trending Movies",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              MovieSlider(),
              SizedBox(
                height: 60,
                child: CategoryRow(CategoryNames: CategoryNames),
              ),
              MovieRow(title: "Upcoming", movies: MoviesData.upComingMovies),
              MovieRow(
                  title: "Now Playing", movies: MoviesData.nowPlayingMovies),
              MovieRow(
                title: "Top Rated",
                movies: MoviesData.topRatedMovies,
              ),
              MovieRow(
                title: "Popular",
                movies: MoviesData.popularMovies,
              ),
            ],
          ),
        ));
  }
}
