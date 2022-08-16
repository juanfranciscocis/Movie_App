
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate{
  MovieSearchDelegate();

  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Search Movies';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text('BuildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('BuildLeading');
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('BuildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Text('BuildSuggestions');
  }
}