import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class LoginApi {

  String token = "";

  String returnToken(String email, String password){
    _makePostRequest(email, password);
    return token;
  }

  Future<Map> _makePostRequest(String email, String password) async {
    String url = 'https://api.grupolenotre.com/login';
    Map<String, String> headers = {"Content-type": "application/json"};
    /*Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $token",
    };*/
    String dados =
        '{"email": "${email}", "senha": "${password}"}';

    http.Response response = await http.post(url,
        headers: headers, body: dados); // check the status code for the result
    int statusCode = response
        .statusCode; // this API passes back the id of the new item added to the body

    if (statusCode == 200)
    {

    }

    token = json.decode(response.body)['usuario']['token'];
    print(token);
    return json.decode(response.body);
  }
}