import 'package:dartz/dartz.dart';
import 'package:watch_mode_flutter/core/usecase/usecase.dart';
import 'package:watch_mode_flutter/data/model/search_req_params.dart';
import 'package:watch_mode_flutter/domain/repository/movie_repository.dart';
import 'package:watch_mode_flutter/service_locator.dart';

class SearchMovieUseCase implements Usecase<Either, SearchReqParams> {
  // @override
  // // ignore: non_constant_identifier_names
  // Future call({String? Param}) {
  //   return sl<MovieRepository>().searchMovie(Param!);
  // }

  @override
  Future<Either> call({SearchReqParams? param}) {
    print('start call SearchMovieUseCase');
    return sl<MovieRepository>().searchMovie(param!);
  }
}
