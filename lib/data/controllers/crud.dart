import 'dart:convert';

import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void createData(context, request, route) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final result = await API().postData(
      route: '/kependudukan/$route',
      data: request,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  print(response.toString());

  if (response['status'] == 200 || response['status'] == 201) {
    customAlert(context, "success", "Data Berhasil Disimpan");
    Navigator.pop(context);
  } else if (response['status'] == 400) {
    customAlert(context, "error", "Pastikan Semua terisi dengan benar");
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Sesion Time Out, Silahkan Login Kembali");
  }
}

void createDataKel(context, requestlokasi, requestKepalaKel, route) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final result = await API().postData(
      route: '/kependudukan/$route',
      data: requestlokasi,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  print(response.toString());
  if (response['status'] == 200 || response['status'] == 201) {
    // Assign 'response' a value before using it
    final lokasiObjekId = response["data"]["id"];

    // Modify 'requestKepalaKel' to include 'LokasiObjekId'
    requestKepalaKel["id_lokasi_objek"] = lokasiObjekId;

    final result2 = await API().postData(
        route: '/kependudukan/kepalakel/add',
        data: requestKepalaKel,
        token: preferences.getString('token'));

    final response2 = jsonDecode(result2.body);

    print(response2.toString());
    if (response2["status"] == 200 || response2['status'] == 201) {
      customAlert(context, "success", "Data Berhasil Disimpan");
    } else if (response['status'] == 400 &&
        response['message'] == 'NIK already exists in the database') {
      customAlert(context, "error", "Data Dengan NIK tersebut sudah ada!");
    } else if (response['status'] == 400) {
      customAlert(context, "error", "Pastikan Semua terisi dengan benar");
    } else if (response['status'] == 401) {
      customAlert(context, "error", "Sesion Time Out, Silahkan Login Kembali");
    }
  } else if (response['status'] == 400) {
    customAlert(context, "error", "Pastikan Semua terisi dengan benar");
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Sesion Time Out, Silahkan Login Kembali");
  }
}

void deleteData(context, String id) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final result = await API().deleteData(
    route: '/kependudukan/$id',
    token: preferences.getString('token'),
  );

  final response = jsonDecode(result.body);

  print(response.toString());
  if (response['status'] == 200 || response['status'] == 201) {
    customAlert(context, "success", "Data Berhasil Dihapus");
    Navigator.pop(context);
  } else if (response['status'] == 404) {
    customAlert(context, "error", "Data Tidak Ditemukan");
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Sesion Time Out, Silahkan Login Kembali");
  }
}
