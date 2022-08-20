
import 'package:flutter/material.dart';
import 'package:movies/models/movie.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate{
  MovieSearchDelegate();

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    final moviesProvider = Provider.of<MoviesProvider>(context);


    return FutureBuilder(
      future: moviesProvider.searchMovie(query),
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData){
          return _EmptyContainer();
        }

        return _MovieSearch(snapshot: snapshot);


      },

    );
  }

  Widget _EmptyContainer(){
    return const Center(
        child:Icon(Icons.movie_creation_outlined, color: Colors.black38,size: 130,)
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions

    if(query.isEmpty){
      return _EmptyContainer();
    }

    final moviesProvider = Provider.of<MoviesProvider>(context);
    moviesProvider.getSuggestionsByQuery(query);


    return StreamBuilder(
      stream: moviesProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
        if(!snapshot.hasData){
          return _EmptyContainer();
        }

        return _MovieSearch(snapshot: snapshot);


      },

    );
  }
}

class _MovieSearch extends StatelessWidget {
  final snapshot;

  _MovieSearch({this.snapshot});


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              image: NetworkImage(snapshot.data![index].getFullUrl()),
              width: 50,
            fit: BoxFit.contain,
          ),
          title: Text(snapshot.data![index].title),
          subtitle: Text(snapshot.data![index].originalTitle),
          onTap:(){
            Navigator.pushNamed(context, 'details', arguments: snapshot.data![index]);
          },


        );
      },



    );
  }
}

