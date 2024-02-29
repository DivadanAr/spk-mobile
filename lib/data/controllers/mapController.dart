import 'dart:convert';

import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:data_kependudukan_mobile/data/model/mapModel.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<LocationData>> getLocation(context) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();

  final data = {
    'a': "123456789".toString(),
  };

  final result = await API().getPost(
      route: '/kependudukan/kepalakeluargalokasi',
      data: data,
      token: preferences.getString('token'));

  final response = jsonDecode(result.body);

  print(response.toString());

  if (response['status'] == 200) {
    List<LocationData> locations = [];
    for (var item in response['data']) {
      locations.add(LocationData.fromJson(item));
    }
    return locations;
  } else if (response['status'] == 401) {
    customAlert(context, "error", "Unauthorization, Silahkan Login Ulang");
  }
  {
    return [];
  }
}
