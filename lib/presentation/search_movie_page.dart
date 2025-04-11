import 'package:flutter/material.dart';
import 'package:watch_mode_flutter/presentation/widgets/text_field_custom_widget.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});
  
  @override
  State<StatefulWidget> createState() => _SearchMoviePage();
}

class _SearchMoviePage extends State<SearchMoviePage> {
  final SearchController = TextEditingController();

  void _onPressedSearchButton() {
    // Handle search button press here
    String query = SearchController.text;
    print('Searching for: $query');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Movie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // TextField takes available space
                Expanded(
                  child: TextFieldCustomWidget(
                    hintText: 'Search',
                    controller: SearchController,
                  ),
                ),
                // Button with fixed size
                SizedBox(
                  width: 100,  // You can adjust the width as needed
                  child: ElevatedButton(
                    onPressed: _onPressedSearchButton,
                    child: Text('Search'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
