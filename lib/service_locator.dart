import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:watch_mode_flutter/core/network/dio_client.dart';
import 'package:watch_mode_flutter/data/repository/movie_repository_impl.dart';
import 'package:watch_mode_flutter/data/repository/remote/movie_api_Service.dart';
import 'package:watch_mode_flutter/domain/repository/movie_repository.dart';
import 'package:watch_mode_flutter/domain/usecase/search_movie_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  // DioClient
  sl.registerSingleton<DioClient>(DioClient());

  // Services
 sl.registerSingleton<MovieApiService>(MoiveApiServiceImpl());

  // Local Service

  // Repository
   sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

     // UseCase
   sl.registerSingleton<SearchMovieUseCase>(SearchMovieUseCase());
  
}
