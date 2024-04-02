// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movie_app/cubit/movies_cubit/movie_cubit.dart';
// import 'package:movie_app/cubit/movies_cubit/video_cubit/video_cubit.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';


// import '../../core/constant/api_constants.dart';


// class Testp extends StatefulWidget {
//   const Testp({super.key});

//   @override
//   State<Testp> createState() => _Testp();
// }

// class _Testp extends State<Testp> {

//   late YoutubePlayerController _controller;

//  @override
//   void initState() {
//     // TODO: implement initState
//    final videoID=YoutubePlayer.convertUrlToId(ApiConstants.youtubeUrl+"YMx8Bbev6T4");

//    _controller=YoutubePlayerController(initialVideoId:videoID! ,flags: const YoutubePlayerFlags(autoPlay: false));
//   }



//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         body: Center(child:
//               YoutubePlayer(
//               controller:_controller,
//               showVideoProgressIndicator: true,
//     onReady:()=> debugPrint("ready"),),),);

//   }
// }
