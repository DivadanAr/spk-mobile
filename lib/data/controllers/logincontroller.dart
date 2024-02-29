import 'dart:convert';
import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:data_kependudukan_mobile/ui/page/controllerPage.dart';
import 'package:data_kependudukan_mobile/ui/page/homePage.dart';
import 'package:data_kependudukan_mobile/ui/page/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void loginUser(context, email, password) async {
  final data = {
    'email': email.toString(),
    'password': password.toString(),
  };

  final result = await API().postRequest(route: '/auth', data: data);

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final token = response['data']['token'];
    if (token != null) {
      await preferences.setString('token', token);
      customAlert(context, "success", "Login berhasil, SELAMAT DATANG!");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      customAlert(context, "error", "Token Error!");
    }
  } else {
    customAlert(context, "error", "Pastikan semuanya terisi dengan benar!");
  }
}

void logOut(context, preferences) async {
  preferences.clear();
  Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const LoginPage()));
}
