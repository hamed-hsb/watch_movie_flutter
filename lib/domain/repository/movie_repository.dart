import 'package:dartz/dartz.dart';
import 'package:watch_mode_flutter/data/model/search_req_params.dart';

abstract class MovieRepository {
  Future<Either> searchMovie(SearchReqParams searchParam);
}
