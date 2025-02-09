import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> data,
    required String? token,
    String contentType = 'application/json',
  }) async {
    var response = await dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Content-Type': contentType,
          'Authorization': 'Bearer $token'
        },
      ),
    );
    return response;
  }
}
