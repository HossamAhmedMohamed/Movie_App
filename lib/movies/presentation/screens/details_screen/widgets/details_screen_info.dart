import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/presentation/cubit/details_movie_cubit/details_movie_cubit.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/widgets/movies_details_descriptions.dart';

class DetailsScreenInfo extends StatelessWidget {
  const DetailsScreenInfo(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.description,
      required this.year,
      required this.rating,
      required this.id});

  final String imgUrl;
  final String title;
  final String description;
  final String year;
  final String rating;
  final int id;
  @override
  Widget build(BuildContext context) {
    List<GenreModel> genres = [];
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 10,
          ),
          MovieDetailsDescription(year: year, rating: rating),
          SizedBox(
            height: 18,
          ),
          Text(description, style: const TextStyle(fontSize: 16.0)),
          SizedBox(
            height: 16,
          ),
          BlocBuilder<DetailsMovieCubit,  DetailsMovieState>(
            builder: (context, state) {
              if (state is MovieDetailsSuccess) {
                genres = state.movieDetails;
                log(genres.toString());
              }

              if (state is MovieDetailsError) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              }
              return Row(
                children: [
                  Text(
                    'Genres:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(width: 8),
                  if (genres.isNotEmpty)
                    ...genres.map((genre) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            genre.name,
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
