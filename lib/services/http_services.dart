import 'dart:convert' show Encoding, utf8;
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class HttpUtils {
  static String errorHeader = 'x-finfree-error';
  static String successResult = 'success';
  static String keyForJWTToken = 'jwt-token';
  static String _baseUrl = 'finfree.app';

  static FlutterSecureStorage storage = new FlutterSecureStorage();
  static String encodeUTF8(String toEncode) {
    return utf8.decode(toEncode.runes.toList());
  }

  static Future<Object> headers() async {
    String jwt = await storage.read(key: HttpUtils.keyForJWTToken);
    if (jwt != null) {
      return {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'R29vZCBMdWNr'
      };
    } else {
      return {
        'Accept': '*/*',
        'Content-Type': 'application/json',
        'Authorization': 'R29vZCBMdWNr'
      };
    }
  }

  static saveJwtToken(String token) async {
    String jwt = token;
    storage.write(key: HttpUtils.keyForJWTToken, value: jwt);
  }

  static delete(String token) async {
    storage.delete(key: HttpUtils.keyForJWTToken,);
  }

  static Future<Response> postRequest<T>(String endpoint, T body) async {
    var headers = await HttpUtils.headers();
    Uri uri = Uri.http(Uri.encodeFull(_baseUrl), endpoint);
    return await http.post(uri,  body: json.encode(body), encoding: Encoding.getByName('utf-8'));
  }

  static Future<Response> postRequestNew<T>(
      String endpoint, Map<dynamic, dynamic> body) async {
    var headers = await HttpUtils.headers();
    Uri uri = Uri.https(Uri.encodeFull(_baseUrl), endpoint);

    var response =
        await http.post(uri, headers: headers, body: json.encode(body));
    return response;

  }

  static Future<Response> getRequest(String endpoint) async {
    var headers = await HttpUtils.headers();
    Uri uri = Uri.https(Uri.encodeFull(_baseUrl), endpoint);

    return await http.get(uri, headers: headers);
  }

  static Future<Response> getRequestParams(String endpoint,Map<String,String> params) async {
    var headers = await HttpUtils.headers();
    Uri uri = Uri.https(Uri.encodeFull(_baseUrl), endpoint,params);

    return await http.get(uri, headers: headers);
  }
}
