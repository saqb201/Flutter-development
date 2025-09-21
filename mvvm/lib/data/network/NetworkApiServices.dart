import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/network/response/status.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/data/network/baseApiServices.dart';
import 'package:mvvm/data/network/response/error_exception.dart';

class Networkapiservices extends BaseApiServices {
  @override
  Future getApiServices(String url) async {
    dynamic responseJson;

    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future postApiServices(String url, dynamic data) async {
    dynamic responseJson;

    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
  }

  dynamic returnResponse(http.Response reponse) {
    switch (reponse) {
      case 200:
        dynamic reponseJson = jsonDecode(reponse.body);
        return reponseJson;
      case 400:
        throw BadRequestException(reponse.body.toString());
      case 404:
        throw NotFoundException(reponse.body.toString());
      case 500:
        throw InternalServerErrorException(reponse.body.toString());
      default:
        throw FetchDataException(
          "Error occured while communiting with server" +
              reponse.statusCode.toString(),
        );
    }
  }
}
