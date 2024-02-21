import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:delivery/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkURL, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkURL), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responseBody = jsonDecode(response.body);
          print(responseBody);
          return Right(responseBody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }
}
