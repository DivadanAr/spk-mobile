import 'dart:convert';

import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<AnggotaKelData>> getAnggotaKel(context) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'NomorKk': "3268271938271".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/anggotakel',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    List<AnggotaKelData> anggotaKel = [];
    for (var item in response['data']) {
      anggotaKel.add(AnggotaKelData.fromJson(item));
    }
    print(response.toString());
    return anggotaKel;
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Unauthorization, Silahkan Login Ulang");
  }
  {
    return [];
  }
}

Future<List<AnggotaKelData>> getAnggotaKelDetail(dynamic context, String parameter) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'NomorKk': "3268271938271".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/anggotakel/search/$parameter',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    List<AnggotaKelData> anggotaKel = [];
    if (response['data'] is Map<String, dynamic>) {
      // If response data is a map, add it directly to the list
      anggotaKel.add(AnggotaKelData.fromJson(response['data']));
    } else if (response['data'] is Iterable) {
      // If response data is an iterable, iterate over it and add each item to the list
      for (var item in response['data']) {
        anggotaKel.add(AnggotaKelData.fromJson(item));
      }
    }
    print(response.toString());
    return anggotaKel;
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Unauthorization, Silahkan Login Ulang");
    throw Exception(
        'Unauthorization, Silahkan Login Ulang'); // throw an exception to ensure that the function doesn't complete normally
  } else {
    return []; // return an empty list to ensure that the function doesn't complete normally
  }
}

Future<List<AnggoraKeluargaPemerlu>> getAnggotaKelPemerlu(context) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'NomorKk': "3268271938271".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/pemerlu',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    List<AnggoraKeluargaPemerlu> anggotaKeluargaPemerlu = [];
    for (var item in response['data']) {
      anggotaKeluargaPemerlu.add(AnggoraKeluargaPemerlu.fromJson(item));
    }
    print(response.toString());
    return anggotaKeluargaPemerlu;
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Unauthorization, Silahkan Login Ulang");
  }
  {
    return [];
  }
}

