import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watch_mode_flutter/common/bloc/search_movie/search_movie_state.dart';
import 'package:watch_mode_flutter/core/usecase/usecase.dart';

class SearchMovieStateCubit extends Cubit<SearchMovieState> {
  SearchMovieStateCubit() : super(SearchMovieInitialState());

  void excute({dynamic params, required Usecase usecase}) async {

    emit(SearchMovieLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    try {
     Either result = await usecase.call(param: params);

     result.fold(
      (error) {
        emit(
          SearchMovieFailureState(errorMessage: error)
        );
      },
      (data) {
        emit(SearchMovieSuccessState());
      }

     );
    } catch(e){
      emit(
        SearchMovieFailureState(errorMessage: e.toString())
      );
    }
  }
}