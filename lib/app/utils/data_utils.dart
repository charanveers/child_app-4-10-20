import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class DataUtils {
	static String getData(SharedPreferences prefs, var key) {
    print("Value is ${prefs.getString(key)}");
    return prefs.getString(key);
	}

	static insertData(SharedPreferences prefs, var key, var value) {
    prefs.setString(key, value);
    print(prefs.getString(key));
	}

  static removeData(SharedPreferences prefs, var key){
    prefs.remove(key);
  }
}
