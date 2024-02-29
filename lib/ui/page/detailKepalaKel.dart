import 'dart:convert';
import 'package:data_kependudukan_mobile/data/http/apiService.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataKeluargaScreen extends StatefulWidget {
  final String nomorKK;

  DataKeluargaScreen({required this.nomorKK});

  @override
  _DataKeluargaScreenState createState() => _DataKeluargaScreenState();
}

class _DataKeluargaScreenState extends State<DataKeluargaScreen> {
  Map<String, dynamic>? dataKel;

  Future<void> fetchData(String nomorKK) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    final data = {
      'NomorKk': nomorKK.toString(),
    };

    // final response = await http.post(
    //   Uri.parse(
    //       'https://together-buzzard-ready.ngrok-free.app/api/kependudukan/datakeluarga'),
    //   body: {'nomor_kk': nomorKK},
    // );

    final result = await API().getPost(
        route: '/kependudukan/datakeluarga',
        data: data,
        token: preferences.getString('token'));

    final response = jsonDecode(result.body);

        print(response);
    if (response['status'] == 200) {
      setState(() {
        dataKel = response['data'];
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData(this.widget.nomorKK);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data Keluarga'),
      ),
      body: dataKel == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF000000).withOpacity(0.1),
                                  offset: Offset(0, 1),
                                  blurRadius: 10,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kepala Keluarga",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    height: 1,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.black,
                                    ),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'No KK ',
                                        style: GoogleFonts.nunito(
                                          color: Colors.black38,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            '${dataKel?['KepalaKeluarga'][0]['nomor_kk']}',
                                        style: GoogleFonts.nunito(
                                            letterSpacing: 0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 15, left: 20, right: 20, top: 22),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Text(
                                          "${dataKel?['KepalaKeluarga'][0]['nama_kk']}",
                                          textAlign: TextAlign.left,
                                          style: GoogleFonts.nunito(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700,
                                            height: 1,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 15, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Color(0xffE9ECEF),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          "Kota",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff636363),
                                              height: 1),
                                        )),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, left: 5),
                                        child: Text(
                                          dataKel?['KepalaKeluarga'][0]['kota'],
                                          style: GoogleFonts.nunito(
                                              color: Colors.black87,
                                              letterSpacing: 0,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffE9ECEF),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            "Desa / Kelurahan",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunito(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff636363),
                                                height: 1),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            dataKel?['KepalaKeluarga'][0]
                                                ['kecamatan'],
                                            style: GoogleFonts.nunito(
                                                color: Colors.black87,
                                                letterSpacing: 0,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                bottom: 15, left: 20, right: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 70,
                                        height: 20,
                                        decoration: BoxDecoration(
                                            color: Color(0xffE9ECEF),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          "Kecamatan",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.nunito(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff636363),
                                              height: 1),
                                        )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: 5, left: 5, right: 10),
                                        child: Text(
                                          dataKel?['KepalaKeluarga'][0]
                                              ['kecamatan'],
                                          style: GoogleFonts.nunito(
                                              color: Colors.black87,
                                              letterSpacing: 0,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Color(0xffE9ECEF),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            "Rt / Rw",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.nunito(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff636363),
                                                height: 1),
                                          )),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 5, left: 5),
                                          child: Text(
                                            dataKel?['KepalaKeluarga'][0]
                                                    ['rt'] +
                                                '/' +
                                                dataKel?['KepalaKeluarga'][0]
                                                    ['rw'],
                                            style: GoogleFonts.nunito(
                                                color: Colors.black87,
                                                letterSpacing: 0,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            width: double.maxFinite,
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 90,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE9ECEF),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(
                                    "Alamat",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.nunito(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xff636363),
                                        height: 1),
                                  )),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5, left: 5),
                                  child: Text(
                                    dataKel?['KepalaKeluarga'][0]['alamat'],
                                    style: GoogleFonts.nunito(
                                        color: Colors.black87,
                                        letterSpacing: 0,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0xFF000000).withOpacity(0.1),
                                  offset: Offset(0, 2),
                                  blurRadius: 15,
                                  spreadRadius: 0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 100,
                                  height: 65,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 11, horizontal: 20),
                                  decoration: BoxDecoration(
                                    color: Color(0xff57A94F).withOpacity(0.21),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${dataKel?['AnggotaKeluarga'].length}",
                                        style: GoogleFonts.nunito(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "Orang",
                                        style: GoogleFonts.nunito(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          height: 1,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Jumlah Anggota Keluarga",
                                      style: GoogleFonts.nunito(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "berikut anggota keluarganya",
                                      style: GoogleFonts.nunito(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                              children: dataKel?['AnggotaKeluarga']
                                      .map<Widget>((anggota) {
                                    String gambar;
                                    if (anggota['jenis_kelamin'] == 'L') {
                                      gambar = 'anak-laki.png';
                                    } else if (anggota['jenis_kelamin'] ==
                                        'P') {
                                      gambar = 'anak-cewe.png';
                                    } else {
                                      gambar = 'ibu.png';
                                    }
                                    String jenisKelamin =
                                        anggota['jenis_kelamin'] == 'L'
                                            ? 'Laki-laki'
                                            : 'Perempuan';
                                    return Container(
                                      margin: EdgeInsets.symmetric(vertical: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 270,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 10),
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFF000000)
                                                      .withOpacity(0.1),
                                                  offset: Offset(0, 2),
                                                  blurRadius: 15,
                                                  spreadRadius: 0,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 15),
                                                  width: 60,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100.0),
                                                    child: Image.asset(
                                                      'assets/$gambar',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "${anggota['nik']}",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 13,
                                                        height: 1.1,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                    Text(
                                                      "${anggota['nama']}",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        height: 1.3,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    Text(
                                                      "$jenisKelamin",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 13,
                                                        height: 1.1,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              ),
                                              color: Color(0xffF1F1F1),
                                            ),
                                            child: Center(
                                              child: Text("Anak"),
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  }).toList() ??
                                  [],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF000000).withOpacity(0.1),
                            offset: Offset(0, 2),
                            blurRadius: 15,
                            spreadRadius: 0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lokasi",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              height: 1,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: double.maxFinite,
                            height: 300,
                            child: FlutterMap(
                              options: MapOptions(
                                center: LatLng(
                                  dataKel?['KepalaKeluarga'][0]['latitude'],
                                  dataKel?['KepalaKeluarga'][0]['longitude'],
                                ),
                                zoom: 14,
                              ),
                              children: [
                                TileLayer(
                                  urlTemplate:
                                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                  subdomains: ['a', 'b', 'c'],
                                ),
                                MarkerLayer(
                                  markers: [
                                    Marker(
                                      width: 100.0,
                                      height: 100.0,
                                      point: LatLng(
                                        dataKel?['KepalaKeluarga'][0]
                                            ['latitude'],
                                        dataKel?['KepalaKeluarga'][0]
                                            ['longitude'],
                                      ),
                                      child: Container(
                                        child: Icon(
                                          Icons.location_on,
                                          color: Colors.red,
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
