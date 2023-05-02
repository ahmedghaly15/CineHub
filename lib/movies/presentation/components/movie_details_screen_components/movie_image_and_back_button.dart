import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/api_constants.dart';
import '../../../../core/utils/constants.dart';
import '../../../domain/entities/movie_details.dart';

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
      expandedHeight: 280.0,
      leading: IconButton(
        onPressed: () => navigateBack(context),
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 25,
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: FadeIn(
          duration: const Duration(milliseconds: 500),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black,
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [0.0, 0.5, 1.0, 1.0],
              ).createShader(
                Rect.fromLTRB(0.0, 0.0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.dstIn,
            child: CachedNetworkImage(
              width: MediaQuery.of(context).size.width,
              imageUrl: ApiConstants.imageUrl(movie.backdropPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
