import 'package:flutter/material.dart';

class CustomSearch extends StatefulWidget {
  final List<Map> todoItems;
  const CustomSearch({Key? key, required this.todoItems}) : super(key: key);

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _search() {
    String searchText = _searchController.text.toLowerCase();
    setState(() {
      if (searchText.isEmpty) {
      } else {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Search'),
              content: TextField(
                controller: _searchController,
                decoration: const InputDecoration(
                  hintText: 'What are you looking for?',
                ),
                onChanged: (_) => _search(),
              ),
            );
          },
        );
      },
      child: Image.asset('images/search.png'),
    );
  }
}
