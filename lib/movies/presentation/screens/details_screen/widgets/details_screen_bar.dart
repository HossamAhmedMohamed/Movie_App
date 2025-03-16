import 'package:flutter/material.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/details_screen.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/widgets/details_screen_image.dart';

class DetailsScreenBar extends StatelessWidget {
  const DetailsScreenBar({
    super.key,
    required this.widget,
  });

  final DetailsScreen widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DetailsScreenImage(widget: widget),
        Positioned(
          left: 5,
          child: SafeArea(
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

