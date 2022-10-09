import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:provider/provider.dart';
import '../widgets/widgets.dart';

class Home_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
        appBar: AppBar(
          title: Text('PELICULAS'),
          elevation: 0,
          actions: [
            IconButton(onPressed: () => showSearch(context: context, delegate: MovieSearchdelegate()), icon: Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //CardSwiper
              CardSwiper(
                movies: moviesProvider.onDisplayMovies,
              ),
              //Slider de peliculas
              MovieSlider(
                movies: moviesProvider.popularDisplayMovies,
                tittle: 'Populares',
                onNextpage: () => moviesProvider.getPopularMovies(),
              ),
              

              //List Horizontal de peliculas
            ],
          ),
        ));
  }
}
