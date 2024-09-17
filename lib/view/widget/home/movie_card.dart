import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/components/constant/images_assets.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {super.key,
      required this.imageUrl,
      required this.rate,
     });
  final String imageUrl;

  final double rate;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: CachedNetworkImage(
        filterQuality: FilterQuality.high,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(),
        ),
        errorWidget: (context, error, stackTrace) {
          return Image.asset(AppImageAssets.noImage);
        },
      ),
    );
  }
}
