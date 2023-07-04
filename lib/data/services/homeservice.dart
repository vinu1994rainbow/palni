import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../di/locator.dart';

import '../api.dart';
import '../apiendpoints.dart';
import '../exceptions/dioexceptions.dart';
import '../models/dataaimodel.dart';

class HomeService {
  var dio = getIt<Api>().dio;

  Future getApi() async {
    try {
      var response = await dio.get(ApiEndPoints.dataApi);
      print("Printing the data of the response");
      print(response.data);
      if (response.statusCode == 200) {
        List<DataApiModel> _model = dataApiModelFromJson(response.data);
        return _model;
      }
    } on DioError catch (e) {
      log("Get Api Check Error log : " + e.toString());
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
