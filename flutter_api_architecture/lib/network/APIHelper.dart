import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutterapiarchitecture/network/APPExceptions.dart';
import 'package:http/http.dart' as http;

class APIHelper {
  static final APIHelper _singleton = APIHelper();

  static APIHelper get instance => _singleton;
  final String _baseUrl = "http://dummy.restapiexample.com/api/v1/";

  Future<dynamic> get(String url) async {
    print('Api Get, url $url');

    var responseJson;
    try {
      final response = await http.get(
        _baseUrl + url,
      );

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> post(String url, {dynamic body}) async {
    print('Api Post, url $url');
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.post(_baseUrl + url,
          headers: header, body: json.encode(body));
      //

      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> put(String url, dynamic body) async {
    print('Api Put, url $url');
    var responseJson;
    try {
      final response = await http.put(_baseUrl + url, body: body);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    print('Api delete, url $url');
    var responseJson;
    try {
      final response = await http.delete(_baseUrl + url);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
      break;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
}
