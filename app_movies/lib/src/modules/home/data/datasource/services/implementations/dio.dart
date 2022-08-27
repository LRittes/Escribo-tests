import 'package:app_movies/src/modules/home/data/datasource/services/interface/service.dart';
import 'package:dio/dio.dart';

class ServiceImp implements Service {
  Dio dio = Dio();

  @override
  Future<Map<String, dynamic>> get(String path) async {
    try {
      final response = await dio.get(path);
      return response.data();
    } catch (e) {
      throw Exception(e);
    }
  }
}
