import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:watch_mode_flutter/core/network/dio_client.dart';
import 'package:watch_mode_flutter/data/model/search_req_params.dart';
import 'package:watch_mode_flutter/service_locator.dart';

abstract class MovieApiService {
  Future<Either> searchMovie(SearchReqParams searchParam);
}

class MoiveApiServiceImpl extends MovieApiService {
  @override
  Future<Either> searchMovie(SearchReqParams searchParam) async {
    try {
      final search =searchParam.searchValue;
      var url =
          'https://api.watchmode.com/v1/autocomplete-search/?apiKey=yDA1Gip0A32anW3b95io29asLGWFwfNKhIxleRgs&search_value=$search&search_type=1';
      print(url);
 print('start call MoiveApiServiceImpl');
      var response = await sl<DioClient>().post(url);

      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
}
