import 'dart:convert';

import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/data/model/kepalaKelModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<KepalaKelData>> getKepalaKel(context) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'a': "123456789".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/kepalakel',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    List<KepalaKelData> kepalaKel = [];
    for (var item in response['data']) {
      kepalaKel.add(KepalaKelData.fromJson(item));
    }
    print(response.toString());
    return kepalaKel;
  } else {
    return [];
  }
}

Future<List<Map<String, dynamic>>> getKepalaKelKecamatan(context) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'a': "123456789".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/kepalakel',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  if (response['status'] == 200) {
    Map<String, int> kepalaKelPerKecamatan = {};

    for (var item in response['data']) {
      String kecamatan = item['kecamatan'];
      kepalaKelPerKecamatan[kecamatan] =
          (kepalaKelPerKecamatan[kecamatan] ?? 0) + 1;
    }

    List<Map<String, dynamic>> chartData = [];

    kepalaKelPerKecamatan.forEach((kecamatan, jumlah) {
      chartData.add({'Kec': kecamatan, 'Anggota': jumlah});
    });

    return chartData;
  } else {
    return [];
  }
}

