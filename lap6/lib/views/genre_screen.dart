import 'package:flutter/material.dart';

import '../controllers/movie_controller.dart';
import '../data/movie_data.dart';
import '../models/movie.dart';

import 'widgets/movie_card.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/genre_chips_widget.dart';
import 'widgets/sort_dropdown_widget.dart';

class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() =>
      _GenreScreenState();
}

class _GenreScreenState
    extends State<GenreScreen> {
  final MovieController controller =
  MovieController();

  String searchQuery = "";

  String sortType = "A-Z";

  final List<String> genres = [
    "Action",
    "Drama",
    "Comedy",
    "Sci-Fi",
    "Adventure",
    "Animation",
  ];

  final Set<String> selectedGenres =
  {};

  @override
  Widget build(BuildContext context) {
    List<Movie> visibleMovies =
    controller.filterAndSortMovies(
      movies: allMovies,
      searchQuery: searchQuery,
      selectedGenres: selectedGenres,
      sortType: sortType,
    );

    return Scaffold(
      appBar: AppBar(
        title:
        const Text("Movie Browser"),
      ),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.all(16),
          child: Column(
            children: [

              const Align(
                alignment:
                Alignment.centerLeft,
                child: Text(
                  "Find a Movie",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SearchBarWidget(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              GenreChipsWidget(
                genres: genres,
                selectedGenres:
                selectedGenres,
                onToggle: (genre) {
                  setState(() {
                    if (selectedGenres
                        .contains(
                        genre)) {
                      selectedGenres
                          .remove(
                          genre);
                    } else {
                      selectedGenres
                          .add(
                          genre);
                    }
                  });
                },
              ),

              const SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    "Sort By: ",
                  ),
                  SortDropdownWidget(
                    value: sortType,
                    onChanged:
                        (value) {
                      setState(() {
                        sortType =
                        value!;
                      });
                    },
                  ),
                ],
              ),

              const SizedBox(height: 10),

              Text(
                "Selected Genres: ${selectedGenres.length}",
              ),

              Expanded(
                child:
                LayoutBuilder(
                  builder:
                      (context,
                      constraints) {

                    if (constraints
                        .maxWidth <
                        800) {

                      return ListView
                          .builder(
                        itemCount:
                        visibleMovies
                            .length,
                        itemBuilder:
                            (context,
                            index) {
                          return MovieCard(
                            movie:
                            visibleMovies[
                            index],
                          );
                        },
                      );
                    }

                    return GridView
                        .builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:
                        2,
                        crossAxisSpacing:
                        10,
                        mainAxisSpacing:
                        10,
                        childAspectRatio:
                        2.2,
                      ),
                      itemCount:
                      visibleMovies
                          .length,
                      itemBuilder:
                          (context,
                          index) {
                        return MovieCard(
                          movie:
                          visibleMovies[
                          index],
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}