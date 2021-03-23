import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authrnticate(String email, String password, String urlSegment) async {
    var url = Uri.parse('https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyAvzFA0gRTtFdnbCMKv12BUKh6jPKLSX9w');
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signup(String email, String password) async {
    return _authrnticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authrnticate(email, password, 'signInWithPassword');
  }

}