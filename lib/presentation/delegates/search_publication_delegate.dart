import 'package:flutter/material.dart';

class SearchPublicationDelegate extends SearchDelegate{

  @override
  String? get searchFieldLabel => 'Buscar' ; 

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null); // <-- i don´t know why this is null 
      }, 
      icon: const Icon(Icons.arrow_back_ios)
      );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResult');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }

  
}