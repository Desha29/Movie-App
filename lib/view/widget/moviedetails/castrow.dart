import 'package:flutter/material.dart';
import '/../controller/moviesdata_controlletr.dart';

class CastRow extends StatelessWidget {
  const CastRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w500${MoviesData.casts[index].profilePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: MoviesData.casts.length,
      ),
    );
  }
}
