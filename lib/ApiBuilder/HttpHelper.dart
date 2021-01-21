import 'dart:convert';

import 'package:flultter_apis/Models/PostModel.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  static HttpHelper _helper;

  // this method is used to create only one instance from this class >>>>
  static HttpHelper getInstance(){
    if(_helper == null) {
      return _helper = HttpHelper() ;
    }
    return _helper ;
  }
  // make a request to server then return the response by http.get() method >>>
  Future<http.Response> _getHttpInstance(String url) {
    return http.get(url) ;
  }

  // convert the json result to model >>>
  Future<List<PostModel>> getDataFromApi(String url) async {
    http.Response response = await _getHttpInstance(url) ;
    if(response.statusCode == 200){
      /**
       * the data is returned in String , this string is json body so you need to convert
       * String to json using json.decode() -> this method take a string then return json
       * and in the end convert json to model
      **/
      List<dynamic> body = json.decode(response.body) ;
      List<PostModel> posts = body.map((json) => PostModel.fromJson(json)).toList();

      return posts ;
    }else {
      // return exception if the result is null >>>>
      return throw Exception("can not load posts from this url") ;
    }
  }
}