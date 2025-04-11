abstract class SearchMovieState {}

class SearchMovieInitialState extends SearchMovieState {}

class SearchMovieLoadingState extends SearchMovieState {}

class SearchMovieSuccessState extends SearchMovieState {}

class SearchMovieFailureState extends SearchMovieState {
  final String errorMessage;
  SearchMovieFailureState({required this.errorMessage});
}