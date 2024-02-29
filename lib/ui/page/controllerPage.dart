import 'package:data_kependudukan_mobile/data/controllers/anggotaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/crud.dart';
import 'package:data_kependudukan_mobile/data/controllers/mapController.dart';
import 'package:data_kependudukan_mobile/ui/page/homePage.dart';
import 'package:data_kependudukan_mobile/ui/page/login.dart';
import 'package:data_kependudukan_mobile/ui/page/pageTes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControllerPage extends StatefulWidget {
  const ControllerPage({super.key});

  @override
  State<ControllerPage> createState() => _ControllerPageState();
}

class _ControllerPageState extends State<ControllerPage> {
  late SharedPreferences preferences;

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    // Now you can use `preferences` safely
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEFF5FB),
      body: _selectedIndex == 0 ? HomePage() : PageTes(),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10.0,
        elevation: 0,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () => logout(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          // getLocation(context);

          final data = {
            "nomor_kk": "00000",
            "nik": "09910",
            "nama": "Ibe",
            "jenis_kelamin": "P",
            "tempat_lahir": "Depok",
            "tanggal_lahir": "1987-01-11T00:00:00Z",
            "agama": "Islam",
            "pendidikan": "D3",
            "jenis_pekerjaan": "Rumah Tangga",
            "status_pernikahan": "2",
            "status_hubungan_dalam_keluarga": "2",
            "kewarganegaraan": "Indonesia",
            "nama_ayah": "Budi Yanto Hartono",
            "nama_ibu": "Sujatmi",
            "golongan_darah": "AB",
            "yatim_piatu": "Tidak",
            "memiliki_usaha": "Tidak",
          };

          final dataLokasi = {
            "id_jenis_objek": 2,
            "identitas_objek": "2",
            "alamat": "gg nangka",
            "desa_kelurahan": "sukakebun",
            "kecamatan": "sukakamu",
            "kota_kab": "Jaksel",
            "provinsi": "Jawa Barat",
            "latitude": -6.397906,
            "longitude": 106.861672,
            "nama_objek": "perumahan",
            "rt": "03",
            "rw": "04",
          };

          final dataKepalaKel = {
            "nomor_kk": "3268271938271",
            "id_lokasi_objek": 1,
            "nama_kk": "Budi Yanto Hartono",
            "alamat":
                "Jl. R R I, Sukamaju, Kec. Cilodong, Kota Depok, Jawa Barat 16415",
            "rt": "01",
            "rw": "02",
            "desa_kelurahan": "Sukamaju",
            "kecamatan": "Cilodong",
            "provinsi": "Jawa Barat",
            "kota": "Depok",
          };

          createData(context, data, 'anggotakel/add');
          // createData(context, dataLokasi, 'lokasiobjek/update/15');
          // createDataKel(context, dataLokasi, dataKepalaKel, 'lokasiobjek/add');
          // deleteData(context, 'lokasiobjek/delete/23');

          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => MapPage(),
          // ));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
        elevation: 4.0,
        highlightElevation: 8.0,
        shape: CircleBorder(), // Membuat FAB menjadi bulat
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
