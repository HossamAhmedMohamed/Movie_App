import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:shimmer/shimmer.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    super.key,
    required this.movie,
  });

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 120.0,
      height: 170.0,
      fit: BoxFit.cover,
      imageUrl:
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      imageBuilder: (context, imageProvider) =>
          Container(
        width: 120.0,
        height: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: 170.0,
          width: 120.0,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.error),
    );
  }
}