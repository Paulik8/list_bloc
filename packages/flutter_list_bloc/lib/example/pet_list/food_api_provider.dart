import 'package:dio/dio.dart';
import 'package:flutter_list_bloc/example/pet_list/models/food.dart';

class FoodApiProvider {
  final String _endpoint = "https://api.spoonacular.com/recipes/complexSearch?";
  final Dio _dio = Dio();

  Future<FoodResponse> getFood({int offset, int limit}) async {
    try {
      final queryParams = <String, dynamic>{
        'apiKey': 'c53e7f53cbaf4740afde8285480dd80e',
        'query': 'pasta',
        'maxFat': 25,
        'offset': offset,
        'number': limit,
      };
      Response response = await _dio.get(_endpoint, queryParameters: queryParams);
      return FoodResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}