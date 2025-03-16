import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movies/domain/entities/movie_entity.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen/widgets/popular_movie_image.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen/widgets/popular_movie_info.dart';
import 'package:movie_app/routing/app_router.dart';

class PopularMovies extends StatelessWidget {
  const PopularMovies({
    super.key,
    required this.movies,
  });

  final List<MovieEntity> movies;

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      duration: const Duration(milliseconds: 500),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        itemCount: 20,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushNamed(
                    AppRouter.detailsMovieScreen,
                    extra: {
                      'imgUrl':
                          'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                      'title': movie.title,
                      'description': movie.overview,
                      'year': movie.releaseDate.split('-').first,
                      'rating': (10 - movie.voteAverage).toStringAsFixed(1),
                      'id': movie.id,
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                  child: Row(
                    children: [
                      MovieImage(movie: movie),
                      SizedBox(
                        width: 8,
                      ),
                      PopularMovieInfo(movie: movie)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
