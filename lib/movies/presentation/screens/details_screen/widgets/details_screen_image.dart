import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/details_screen.dart';
import 'package:shimmer/shimmer.dart';

class DetailsScreenImage extends StatelessWidget {
  const DetailsScreenImage({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height / 3,
      fit: BoxFit.cover,
      imageUrl: widget.imgUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey[850]!,
        highlightColor: Colors.grey[800]!,
        child: Container(
          height: MediaQuery.sizeOf(context).width / 2,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
