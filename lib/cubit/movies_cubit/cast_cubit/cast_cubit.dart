import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../model/movies_model.dart';
import '../../../data/api/get_movies.dart';

part 'cast_states.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  static List<Casts> casts = [];
  static int id = 0;
  static List movieList = [];
  static bool favorite = false;

  Future<void> getCast({required int id, required List movies}) async {
    emit(CastLoadingState());
    try {
      await getCastData(id);
      movieList = movies;
      emit(GetCastSuccessfullyState(id: id, cast: casts));
    } catch (e) {
      emit(GetCastFailedState("get cast error"));
    }
  }

  Future<void> getCastData(int id) async {
    DioHelper.id = id.toString();
    print(".........................");
    CastCubit.id = id;
    List castList = await DioHelper().getCasts();
    casts = Casts.convertToCasts(castList);
  }

  void clearCast() {
    casts.clear();
    emit(CastInitial());
  }
}
