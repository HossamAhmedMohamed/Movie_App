import 'package:flutter/material.dart';

AppBar getMovieAppBar() {
    return AppBar(
        backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text('Popular Movies'));
  }