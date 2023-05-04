import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerMoviesListView extends StatelessWidget {
  const ShimmerMoviesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
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
    );
  }
}
