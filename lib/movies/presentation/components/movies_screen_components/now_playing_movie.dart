import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/global/app_styles.dart';
import '/core/network/api_constants.dart';
import '/movies/domain/entities/movies.dart';

class NowPlayingMovie extends StatelessWidget {
  final Movies movie;
  const NowPlayingMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                // fromLTRB
                Colors.transparent,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [
                0,
                0.3,
                0.5,
                1,
              ],
            ).createShader(
              Rect.fromLTRB(
                0,
                0,
                rect.width,
                rect.height,
              ),
            );
          },
          blendMode: BlendMode.dstIn,
          child: CachedNetworkImage(
            height: 560.0,
            imageUrl: ApiConstants.imageUrl(movie.backdropPath),
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.circle,
                      color: Colors.redAccent,
                      size: 16.0,
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      'Now Playing'.toUpperCase(),
                      style: AppStyles.textStyle16,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  movie.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle24,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
