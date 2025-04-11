// --- Presentation Layer (Bloc) ---
abstract class SearchMovieEvent {}

class SearchMovieEventPressed extends SearchMovieEvent {
  final String searchValue;

  SearchMovieEventPressed(this.searchValue);
}
