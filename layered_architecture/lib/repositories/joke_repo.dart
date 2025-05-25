import 'package:dio/dio.dart';
import 'package:layered_architecture/entities/joke_model.dart';

class JokeRepo {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://official-joke-api.appspot.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<JokeModel?> getJoke() async {
    try {
      final response = await _dio.get('/random_joke');
      if (response.statusCode == 200) {
        return JokeModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load jokes');
      }
    } catch (e) {
      throw Exception('Failed to load jokes: $e');
    }
  }
}
