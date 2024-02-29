import 'package:data_kependudukan_mobile/ui/page/controllerPage.dart';
import 'package:data_kependudukan_mobile/ui/page/detailKepalaKel.dart';
import 'package:data_kependudukan_mobile/ui/page/form/formAnggotaKel.dart';
import 'package:data_kependudukan_mobile/ui/page/homePage.dart';
import 'package:data_kependudukan_mobile/ui/page/kepalaKeluargaPage.dart';
import 'package:data_kependudukan_mobile/ui/page/anggotaKeluargaPage.dart';
import 'package:data_kependudukan_mobile/ui/page/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        platform: TargetPlatform.iOS,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blueAccent),
            );
          } else if (snapshot.hasError) {
            return Text('Something error');
          } else if (snapshot.hasData) {
            final token = snapshot.data!.getString('token');
            if (token != null) {
              return HomePage();
            } else {
              return LoginPage();
            }
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
