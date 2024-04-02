import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/cubit/movies_cubit/cast_cubit/cast_cubit.dart';
import 'package:movie_app/components/loading_widget.dart';
import '../../../components/exception_widget.dart';

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
          return _GetCastFailedState(state.message);
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

  Widget _GetCastFailedState(String message) =>
      ExceptionWidget(icon: Icons.error, message: message);

  Widget _getCastSuccessfully({required List cast}) {
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
                      "https://image.tmdb.org/t/p/w500${cast[index].profilePath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: cast.length,
      ),
    );
  }
}
