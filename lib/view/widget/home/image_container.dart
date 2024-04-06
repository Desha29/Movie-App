import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/components/constant/colors.dart';
import 'package:movie_app/components/constant/imageassets.dart';
import 'package:shimmer/shimmer.dart';

class Image_Container extends StatelessWidget {
  Image_Container({required this.imageUrl, required this.rate});
  final String imageUrl;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
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
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 40,
            height: 24,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: ColorPalette.darkPrimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                rate.toString(),
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
