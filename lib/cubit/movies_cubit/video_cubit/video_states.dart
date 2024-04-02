part of 'video_cubit.dart';

@immutable
sealed class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoadingState extends VideoState {}

final class VideoSuccessfullyState extends VideoState {
  final List videos;
  final int id;
  final YoutubePlayerController controller;

  VideoSuccessfullyState(this.controller,
      {required this.videos, required this.id});
}

final class VideoFailedState extends VideoState {
  final String message;

  VideoFailedState({required this.message});
}
