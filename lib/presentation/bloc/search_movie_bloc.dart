import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_mode_flutter/common/bloc/search_movie/search_movie_state.dart';
import 'package:watch_mode_flutter/core/usecase/usecase.dart';
import 'package:watch_mode_flutter/presentation/bloc/search_movie_event.dart';

class SearchMovieStateBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  SearchMovieStateBloc() : super(SearchMovieInitialState());

  void excute({dynamic params, required Usecase usecase}) async {
    print('strat call excute');
    emit(SearchMovieLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
      if (usecase is Null) {
        print('strat call excute');
        usecase.call(param: params);
      }
      Either result = await usecase.call(param: params);

      result.fold(
        (error) {
           print('strat call fold error');
          emit(SearchMovieFailureState(errorMessage: error));
        },
        (data) {
               print('strat call fold data');
          emit(SearchMovieSuccessState());
        },
      );
    } catch (e) {
        print('strat call fold catch');
           print('strat call fold catch ${e.toString()}');
      emit(SearchMovieFailureState(errorMessage: e.toString()));
    }
  }
}
