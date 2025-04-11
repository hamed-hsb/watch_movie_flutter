import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_mode_flutter/common/bloc/search_movie/search_movie_state.dart';
import 'package:watch_mode_flutter/common/bloc/search_movie/search_movie_state_cubit.dart';
import 'package:watch_mode_flutter/data/model/search_req_params.dart';
import 'package:watch_mode_flutter/domain/usecase/search_movie_usecase.dart';
import 'package:watch_mode_flutter/presentation/bloc/search_movie_bloc.dart';
import 'package:watch_mode_flutter/presentation/widgets/text_field_custom_widget.dart';
import 'package:watch_mode_flutter/service_locator.dart';

class SearchMoviePage extends StatefulWidget {
  const SearchMoviePage({super.key});

  @override
  State<StatefulWidget> createState() => _SearchMoviePage();
}

class _SearchMoviePage extends State<SearchMoviePage> {
  final searchController = TextEditingController();

  void _onPressedSearchButton() {
    // Handle search button press here
    String query = searchController.text;
    print('Searching for: $query');

    // context.read<SearchMovieStateCubit>().excute(
    //   usecase: sl<SearchMovieUseCase>(),
    //   searchController.text
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Movie')),
      body: BlocProvider(
        create: (context) => SearchMovieStateBloc(),
        child: BlocConsumer<SearchMovieStateBloc, SearchMovieState>(
          listener: (context, state) {
            if (state is SearchMovieInitialState) {}

            if (state is SearchMovieLoadingState) {}

            if (state is SearchMovieSuccessState) {}

            if (state is SearchMovieFailureState) {}
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // TextField takes available space
                      Expanded(
                        child: TextFieldCustomWidget(
                          hintText: 'Search',
                          controller: searchController,
                        ),
                      ),
                      // Button with fixed size
                      SizedBox(
                        width: 100, // You can adjust the width as needed
                        child: ElevatedButton(
                          onPressed: () {
                            String query = searchController.text;
                            print('Searching for: $query');

                            context.read<SearchMovieStateBloc>().excute(
                              usecase: sl<SearchMovieUseCase>(),
                              params:
                                  SearchReqParams(searchValue: searchController.text),
                            );
                          },
                          child: Text('Search'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
