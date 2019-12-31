import 'package:dio/dio.dart';
import 'package:flutteflix/key.dart';
import 'package:flutteflix/model/omdb.dart';

class OMDBApiProvider {
  final String _endpoint = "http://www.omdbapi.com/?";
  final Dio _dio = Dio();

  Future<OMDB> getUser({String s = 'batman'}) async {
    try {
      Response response = await _dio.get('${_endpoint}s=$s&r=json&apikey=$key');
      return OMDB.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return OMDB.withError("$error");
    }
  }
}
