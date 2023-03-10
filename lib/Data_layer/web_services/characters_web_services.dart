import 'dart:developer';

import '../../constants/constants.dart';
import 'package:dio/dio.dart';

class CharactersWebServices {
  // late Dio dio;
  // CharactersWebServices() {
  //   BaseOptions options = BaseOptions(
  //       baseUrl: baseUrl,
  //       receiveDataWhenStatusError: true,
  //       connectTimeout: 20 * 1000,
  //       receiveTimeout: 20 * 1000);
  //   dio = Dio(options);

  // }
  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('character');
      log('message');
      return response.data['results'];
    } catch (e) {
      log(e.toString());

      return [];
    }
  }

  late Dio dio;
  CharactersWebServices() {
    BaseOptions? options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 20 * 1000,
        receiveTimeout: 20 * 1000);
    dio = Dio(options);
  }
  Future<List<dynamic>> getQoutes(String charName) async {
    try {
      Response response =
          await dio.get('qoute', queryParameters: {'author': charName});
      return response.data;
    } on Exception catch (e) {
      log(e.toString());
      return [];
    }
  }
}
