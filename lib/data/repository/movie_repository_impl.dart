import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch_mode_flutter/data/model/search_req_params.dart';
import 'package:watch_mode_flutter/data/repository/remote/movie_api_Service.dart';
import 'package:watch_mode_flutter/domain/repository/movie_repository.dart';
import 'package:watch_mode_flutter/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either> searchMovie(SearchReqParams searchParam) async {
    print('start call MovieRepositoryImpl');
    Either result = await sl<MovieApiService>().searchMovie(searchParam);
    return result.fold(
      (error) {
        return Left(error);
      },
      (data) async {
        Response response = data;
        // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        // sharedPreferences.setString('token', response.data['token']);
        return Right(response);
      },
    );
  }
}
