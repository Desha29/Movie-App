import 'package:flutter/material.dart';

import '../widget/movie_categories/MovieContainer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            // Text(
            //   "ٌRecommended",
            //   style: TextStyle(
            //       color: Colors.white,
            //       fontSize: 17,
            //       fontWeight: FontWeight.w600),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    // return MovieContainer(
                    //   movieName: "The last of us",
                    //   ratingNumber: "8.0",
                    //   Categories: "Action/Drama/Horror",
                    //   movieImage: AppImageAssets.onBoardingThree,
                    // );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
