import 'dart:async';
import 'package:cardsearch/data/api/api_config.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConfig.baseUrl, connectTimeout: 5000, receiveTimeout: 5000));

  // get all categories of products

  // subcategory of category

  // all products

}
