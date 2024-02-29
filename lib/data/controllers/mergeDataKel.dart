import 'dart:convert';

import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/data/model/mergeDataKelModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<MergeDataKel> getDataKel(String nomorKK) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'NomorKK': nomorKK,
  };

  final result = await API().getPost(
    route: '/kependudukan/anggotakel',
    data: data,
    token: preferences.getString('token'),
  );

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    return MergeDataKel.fromJson(response['data']);
  } else {
    throw Exception('Failed to load data');
  }
}
