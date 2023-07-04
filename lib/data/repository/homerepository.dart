import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';

import '../../../di/locator.dart';

import '../exceptions/dioexceptions.dart';
import '../services/homeservice.dart';

class HomeRepository {
  // var loginService = getIt<LoginService>();
  var homeService = getIt<HomeService>();
  Future<dynamic> getApi() async {
    try {
      var response = await homeService.getApi();
      return response;
    } catch (e) {
      log("GEt  API EXCEPTION : $e");
      throw e;
    }
  }
}