import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:swish_child_app/app/utils/constants.dart' as Constants;


class NetworkUtils {
  static final String host = Constants.HOST;

  static dynamic loginUser(String mobileNumber, String countryCode) async{
    var uri = host + '/api/user/login';
    print(uri);
    try {
      final response = await http.post(
        uri,
        body: {
          'mobileNo': mobileNumber,
          'countryCode': "+$countryCode",
          'loginType': 'Mobile'
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic sendOTP(int countryCode, String _phone, int _otp) async{
    var uri = host + '/api/forgot_password/request_otp';
    try {
      final response = await http.post(
        uri,
        body: {
          
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic validateOtp(String reset_password_token, String otp) async{
    var uri = host + '/api/forgot_password/validate_otp';
    try {
      final response = await http.post(
        uri,
        body: {
          'reset_password_token':reset_password_token,
          'otp': otp,
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic resetPassword(String reset_password_token, String password, String passwordConfirmation) async{
    var uri = host + '/api/forgot_password/reset_password';
    try {
      final response = await http.post(
        uri,
        body: {
          'reset_password_token':reset_password_token,
          'password': password,
          'password_confirmation': passwordConfirmation
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic getUser(String mobileNumber) async {
    var uri = host + '/api//users/get?mobile_number=$mobileNumber';

    try {
      var response = await http.get(uri);
      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic getUserProfile(String authToken) async {
    var uri = host + '/api//users/profile?token=$authToken';

    try {
      var response = await http.get(uri);
      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic getProductCategories() async {
    var uri = host + '/api/categories';

    try {
      var response = await http.get(uri);
      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic categoryShow(String slug) async {
    var uri = host + '/api/categories/$slug';

    try {
      var response = await http.get(uri);
      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic productShow(String slug) async {
    var uri = host + '/api/products/$slug';

    try {
      var response = await http.get(uri);
      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic signupUser(String name, String email, String phone, String password) async {
    var uri = host + '/api/user/signup';

    try {
      final response = await http.post(
        uri,
        body: {
          'name': name,
          'email': email,
          'phone_number': phone,
          'password': password,
          'confirm_password': password
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static dynamic markProductFavourite(String token, int id) async {
    var uri = host + '/api/user/favourite_products/add_product';

    try {
      final response = await http.post(
        uri,
        headers: {HttpHeaders.authorizationHeader: "Token $token"},
        body: {
          'product': id,
        }
      );

      final responseJson = json.decode(response.body);
      return responseJson;

    } catch (exception) {
      print(exception);
      if(exception.toString().contains('SocketException')) {
        return 'NetworkError';
      } else {
        return null;
      }
    }
  }

  static showSnackBar(String message) {
    Fluttertoast.showToast(msg: message ?? 'You are offline', toastLength: Toast.LENGTH_LONG, backgroundColor: Colors.black87, textColor: Colors.white);
  }
}