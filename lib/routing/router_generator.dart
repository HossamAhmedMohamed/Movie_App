import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/details_screen.dart';
import 'package:movie_app/movies/presentation/screens/popular_movies_screen/movies_screen.dart';
import 'package:movie_app/routing/app_router.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    errorBuilder: (context, state) {
      return Scaffold(
        body: Center(
          child: Text(state.error.toString()),
        ),
      );
    },
    initialLocation: AppRouter.popularMovieScreen,
    routes: [
      GoRoute(
        path: AppRouter.popularMovieScreen,
        name: AppRouter.popularMovieScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => MoviesCubit(),
          child: MoviesScreen(),
        ),
      ),
      GoRoute(
          path: AppRouter.detailsMovieScreen,
          name: AppRouter.detailsMovieScreen,
          builder: (context, state) {
            final extra = state.extra as Map<String, dynamic>?;
            return BlocProvider(
              create: (context) => MoviesCubit(),
              child: DetailsScreen(
                imgUrl: extra!['imgUrl'] ?? '',
                title: extra['title'] ?? '',
                description: extra['description'] ?? '',
                year: extra['year'] ?? '',
                rating: extra['rating'] ?? '',
                id: extra['id'] ?? 0,
              ),
            );
          }),
    ],
  );
}
