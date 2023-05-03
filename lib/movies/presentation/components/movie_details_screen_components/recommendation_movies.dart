import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cine_app/movies/presentation/screens/movie_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/global/app_navigation.dart';
import '../../../../core/network/api_constants.dart';
import '../../controllers/movie_details_controller/movie_details_bloc.dart';

class RecommendationMovies extends StatelessWidget {
  const RecommendationMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsStates>(
      builder: (context, state) {
        return SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final recommendation = state.recommendations[index];
              return FadeInUp(
                from: 20,
                duration: const Duration(milliseconds: 500),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                  child: GestureDetector(
                    onTap: () {
                      AppNavigation.navigateTo(
                        context: context,
                        screen: MovieDetailsScreen(id: recommendation.id),
                      );
                    },
                    child: CachedNetworkImage(
                      imageUrl:
                          ApiConstants.imageUrl(recommendation.backdropPath!),
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey[850]!,
                        highlightColor: Colors.grey[800]!,
                        child: Container(
                          height: 170.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 180.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
            childCount: state.recommendations.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 1.5 / 2,
            crossAxisCount: 3,
          ),
        );
      },
    );
  }
}
