import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/data/models/genre_model.dart';
import 'package:movie_app/movies/presentation/cubit/movie_cubit/movie_cubit.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/widgets/details_screen_bar.dart';
import 'package:movie_app/movies/presentation/screens/details_screen/widgets/details_screen_info.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen(
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
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  List<GenreModel> genres = [];
  @override
  void initState() {
    BlocProvider.of<MoviesCubit>(context).fetchMovieDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            DetailsScreenBar(widget: widget),
            SizedBox(
              height: 10,
            ),
            DetailsScreenInfo(
                imgUrl: widget.imgUrl,
                title: widget.title,
                description: widget.description,
                year: widget.year,
                rating: widget.rating,    
                id: widget.id,)
          ],
        ),
      ),
    );
  }
}
