import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '/core/components/back_button.dart';
import '/core/network/api_constants.dart';
import '/movies/domain/entities/movie_details.dart';

class MovieImageAndBackButton extends StatelessWidget {
  const MovieImageAndBackButton({
    super.key,
    required this.movie,
  });

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: 300.0,
      leading: const GetBackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent.withOpacity(0.2),
                  Colors.black,
                  Colors.black,
                  Colors.transparent.withOpacity(0.2),
                ],
                stops: const [0.0, 0.4, 1.0, 1.0],
              ).createShader(
                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: Hero(
              tag: movie.id,
              child: CachedNetworkImage(
                width: MediaQuery.of(context).size.width,
                imageUrl: ApiConstants.imageUrl(movie.backdropPath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
