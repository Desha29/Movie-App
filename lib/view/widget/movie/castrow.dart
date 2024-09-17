import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movies_cubit/cast_cubit/cast_cubit.dart';
import 'package:shimmer/shimmer.dart';
import '../../../components/components.dart';
import '../../../components/constant/images_assets.dart';

class CastRow extends StatelessWidget {
  const CastRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CastCubit, CastState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetCastFailedState) {
          return _getCastFailedState(state.message);
        } else if (state is GetCastSuccessfullyState) {
          return _getCastSuccessfully(cast: state.cast);
        } else if (state is CastLoadingState) {
          return const LoadingWidget();
        } else {
          return const ExceptionWidget(
              icon: Icons.error, message: "failed cast row state");
        }
      },
    );
  }

  Widget _getCastFailedState(String message) =>
      ExceptionWidget(icon: Icons.error, message: message);

  Widget _getCastSuccessfully({required List cast}) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                  width: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://image.tmdb.org/t/p/w500${cast[index].profilePath}",
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.high,
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
                ),
                const SizedBox(height: 10),
                Text(cast[index].originalName,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    maxLines: 1)
              ],
            ),
          );
        },
        itemCount: cast.length,
      ),
    );
  }
}
