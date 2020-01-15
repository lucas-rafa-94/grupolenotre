import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';

class UserModel extends Model {

    bool isLoading = false;

    int codigoResposta = 0;

    String token = '';
    String userName = '';


    void signIn({@required String email, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFailure }){
      _makePostRequest(email: email, pass: pass, onSuccess: onSuccess, onFailure: onFailure );
    }

    void signOut(){

    }


    Future<Map> _makePostRequest({@required String email, @required String pass, @required VoidCallback onSuccess, @required VoidCallback onFailure }) async {

      isLoading = true;
      notifyListeners();

      String url = 'https://api.grupolenotre.com/login';
      Map<String, String> headers = {"Content-type": "application/json"};
      /*Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: "application/json", // or whatever
      HttpHeaders.authorizationHeader: "Basic $token",
    };*/
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
}