part of 'cast_cubit.dart';

@immutable
sealed class CastState {}

final class CastInitial extends CastState {}

final class CastLoadingState extends CastState {}

final class GetCastSuccessfullyState extends CastState {
  final List cast;
  final int id;

  GetCastSuccessfullyState({required this.id, required this.cast});
}

final class GetCastFailedState extends CastState {
  final String message;

  GetCastFailedState(this.message);
}
