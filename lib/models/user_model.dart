import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:grupolenotre/datas/filial_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {

    bool isLoading = false;

    int codigoResposta = 0;

    String token = '';
    String userName = '';


    void signIn({@required String email, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFailure }){
      _makePostLoginRequest(email: email, pass: pass, onSuccess: onSuccess, onFailure: onFailure );
    }

    void filialUpdate({@required FilialData filialData, @required Future<void> Function() onSuccess, @required Future<void> Function() onFailure }){
      _makeFilialPutRequest(filialData, onSuccess, onFailure);
    }

    void filialCreate({@required FilialData filialData, @required Future<void> Function() onSuccess, @required Future<void> Function() onFailure }){
      _makeFilialPostRequest(filialData, onSuccess, onFailure);
    }

    void filialDelete({@required FilialData filialData, @required Future<void> Function() onSuccess, @required Future<void> Function() onFailure }){
      _makeFilialDeleteRequest(filialData, onSuccess, onFailure);
    }

    Future<Map> _makePostLoginRequest({@required String email, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFailure }) async {

      isLoading = true;
      notifyListeners();

      String url = 'https://api.grupolenotre.com/login';
      Map<String, String> headers = {"Content-type": "application/json"};
      String dados =
          '{"email": "${email}", "senha": "${pass}"}';
      http.Response response = await http.post(url,
          headers: headers,
          body: dados); // check the status code for the result
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      print(statusCode);
      if (statusCode == 200) {
        codigoResposta = json.decode(response.body)['codigo'];
        print(codigoResposta);
        if(codigoResposta == 10){
          print(json.decode(response.body)['usuario']['token']);
          print(json.decode(response.body)['usuario']['nome']);
          token = json.decode(response.body)['usuario']['token'];
          userName = json.decode(response.body)['usuario']['nome'];
          isLoading = false;
          onSuccess();
          notifyListeners();
        }else if  (codigoResposta == 230 || codigoResposta == 200 ){
          isLoading = false;
          notifyListeners();
          onFailure();
        }
      }else{
        isLoading = false;
        notifyListeners();
        onFailure();
      }

      return json.decode(response.body);
    }

    Future<String> _makeFilialPutRequest(FilialData filialData, Future<void> Function() onSuccess, Future<void> Function() onFailure   ) async {
      isLoading = true;
      notifyListeners();
      print('Entrou - ${filialData.cs}');

      String url = 'https://api.grupolenotre.com/filiais/${filialData.cs}';

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Basic ${token}",
      };

      print(json.encode(filialData.toJson()));

      http.Response response = await http.put(url,
          headers: headers, body: json.encode(filialData.toJson()));
      int statusCode = response
          .statusCode;

      print(response.body);

      if (statusCode == 200) {
        codigoResposta = json.decode(response.body)['codigo'];
        print(codigoResposta);
        if(codigoResposta == 120){
          isLoading = false;
          onSuccess();
          notifyListeners();
        }else if  (codigoResposta == 220 ){
          isLoading = false;
          notifyListeners();
          onFailure();
        }
      }else{
        isLoading = false;
        notifyListeners();
        onFailure();
      }

      return response.body;
    }

    Future<String> _makeFilialDeleteRequest(FilialData filialData, Future<void> Function() onSuccess, Future<void> Function() onFailure   ) async {
      isLoading = true;
      notifyListeners();

      String url = 'https://api.grupolenotre.com/filiais/${filialData.cs}';

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Basic ${token}",
      };

      print(json.encode(filialData.toJson()));

      http.Response response = await http.delete(url,
          headers: headers);
      int statusCode = response
          .statusCode;

      print(response.body);

      if (statusCode == 200) {
        codigoResposta = json.decode(response.body)['codigo'];
        print(codigoResposta);
        if(codigoResposta == 130){
          isLoading = false;
          onSuccess();
          notifyListeners();
        }else{
          isLoading = false;
          notifyListeners();
          onFailure();
        }
      }else{
        isLoading = false;
        notifyListeners();
        onFailure();
      }

      return response.body;
    }

    Future<String> _makeFilialPostRequest(FilialData filialData, Future<void> Function() onSuccess, Future<void> Function() onFailure   ) async {
      isLoading = true;
      notifyListeners();

      String url = 'https://api.grupolenotre.com/filiais';

      Map<String, String> headers = {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Basic ${token}",
      };

      print(json.encode(filialData.toJson()));
      http.Response response = await http.post(url,
          headers: headers, body: json.encode(filialData.toJson()));
      int statusCode = response
          .statusCode;

      print(response.body);

      if (statusCode == 200) {
        codigoResposta = json.decode(response.body)['codigo'];
        print(codigoResposta);
        if(codigoResposta == 110){
          isLoading = false;
          onSuccess();
          notifyListeners();
        }else{
          isLoading = false;
          notifyListeners();
          onFailure();
        }
      }else{
        isLoading = false;
        notifyListeners();
        onFailure();
      }

      return response.body;
    }



}