import 'package:data_kependudukan_mobile/data/controllers/crud.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:data_kependudukan_mobile/ui/components/customInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormAnggotaKel extends StatefulWidget {
  const FormAnggotaKel({super.key});

  @override
  State<FormAnggotaKel> createState() => _FormAnggotaKelState();
}

class _FormAnggotaKelState extends State<FormAnggotaKel> {
  final nomor_kk = TextEditingController();
  final nik = TextEditingController();
  final nama = TextEditingController();
  final tempat_lahir = TextEditingController();
  final pendidikan = TextEditingController();
  final jenis_pekerjaan = TextEditingController();
  final kewarganegaraan = TextEditingController();
  final nama_ayah = TextEditingController();
  final nama_ibu = TextEditingController();

  String? valueJk;
  String? valueAgama;
  String? valueGolDar;
  String? valueNikah;
  String? valueUsaha;
  String? valueYatim;
  String? valueHubungan;
  DateTime _selectedDate = DateTime.now();
  bool selectDate = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Color(0xff12AA86).withOpacity(0.7),
              width: double.maxFinite,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 260,
                    height: 170,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg-head.png"),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Data Anggota Keluarga",
                    style: GoogleFonts.nunito(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white,
                        letterSpacing: .5),
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 250,
                    child: Text(
                      "Pastikan data yang dimasukan telah sesuai dan benar dengan KTP",
                      style: GoogleFonts.nunito(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.white,
                          letterSpacing: .5),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              margin: EdgeInsets.only(top: 150),
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 243, 248, 253),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                children: [
                  CustomField(
                      label: "Nomor Kartu Keluarga", controller: nomor_kk),
                  CustomField(label: "NIK", controller: nik),
                  CustomField(label: "Nama", controller: nama),
                  CustomDropdown(
                    label: "Jenis Kelamin",
                    value: valueJk,
                    items: ["Laki-laki", "Perempuan"],
                    onChanged: (value) {
                      setState(() {
                        valueJk = value;
                      });
                    },
                  ),
                  CustomField(label: "Tempat Lahir", controller: tempat_lahir),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal Lahir",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                            letterSpacing: 0),
                      ),
                      SizedBox(height: 8.0),
                      GestureDetector(
                        onTap: () {
                          _selectDate(context);
                          selectDate = true;
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 35, bottom: 3, right: 3, top: 17),
                          width: double.maxFinite,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF000000).withOpacity(0.10),
                                offset: Offset(1, 2),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ],
                          ),
                          child: Text(
                              selectDate
                                  ? DateFormat('yyyy-MM-dd')
                                      .format(_selectedDate)
                                      .toString()
                                  : "Pilih Tanggal",
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black54,
                                  fontSize: 15)),
                        ),
                      ),
                    ],
                  ),
                  CustomDropdown(
                    label: "Agama",
                    value: valueAgama,
                    items: [
                      "Islam",
                      "Kristen Protestan",
                      "Katolik",
                      "Hindu",
                      "Buddha",
                      "Konghucu"
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueAgama = value;
                      });
                    },
                  ),
                  CustomField(label: "Pendidikan", controller: pendidikan),
                  CustomField(
                      label: "Jenis Pekerjaan", controller: jenis_pekerjaan),
                  CustomDropdown(
                    label: "Status Pernikahan",
                    value: valueNikah,
                    items: [
                      "Belum Kawin",
                      "Kawin",
                      "Cerai Hidup",
                      "Cerai Mati",
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueNikah = value;
                      });
                    },
                  ),
                  CustomDropdown(
                    label: "Status Pernikahan",
                    value: valueNikah,
                    items: [
                      "Ayah",
                      "Ibu",
                      "Anak",
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueNikah = value;
                      });
                    },
                  ),
                  CustomField(
                      label: "Kewarganegaraan", controller: kewarganegaraan),
                  CustomField(label: "Nama Ayah", controller: nama_ayah),
                  CustomField(label: "Nama Ibu", controller: nama_ibu),
                  CustomDropdown(
                    label: "Golongan Darah",
                    value: valueGolDar,
                    items: [
                      "A",
                      "B",
                      "AB",
                      "O",
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueGolDar = value;
                      });
                    },
                  ),
                  CustomDropdown(
                    label: "Yatim Piatu",
                    value: valueYatim,
                    items: [
                      "Ya",
                      "Tidak",
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueYatim = value;
                      });
                    },
                  ),
                  CustomDropdown(
                    label: "Memiliki Usaha",
                    value: valueUsaha,
                    items: [
                      "Ya",
                      "Tidak",
                    ],
                    onChanged: (value) {
                      setState(() {
                        valueUsaha = value;
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (nomor_kk.text.isEmpty ||
                        //     nik.text.isEmpty ||
                        //     nama.text.isEmpty ||
                        //     // jenis_kelamin.text.isEmpty ||
                        //     tempat_lahir.text.isEmpty ||
                        //     tanggal_lahir.text.isEmpty ||
                        //     agama.text.isEmpty ||
                        //     pendidikan.text.isEmpty ||
                        //     jenis_pekerjaan.text.isEmpty ||
                        //     // status_pernikahan.text.isEmpty ||
                        //     // status_hubungan_dalam_keluarga.text.isEmpty ||
                        //     kewarganegaraan.text.isEmpty ||
                        //     nama_ayah.text.isEmpty ||
                        //     nama_ibu.text.isEmpty ||
                        //     golongan_darah.text.isEmpty ||
                        //     yatim_piatu.text.isEmpty ||
                        //     memiliki_usaha.text.isEmpty) {
                        //   customAlert(
                        //       context, "error", "Pastikan Semua sudah terisi");
                        // } else {
// Memeriksa apakah semua data sudah terisi
                        if (nomor_kk.text.isEmpty ||
                            nik.text.isEmpty ||
                            nama.text.isEmpty ||
                            valueJk == null ||
                            tempat_lahir.text.isEmpty ||
                            valueAgama == null ||
                            pendidikan.text.isEmpty ||
                            jenis_pekerjaan.text.isEmpty ||
                            valueNikah == null ||
                            valueHubungan == null ||
                            kewarganegaraan.text.isEmpty ||
                            nama_ayah.text.isEmpty ||
                            nama_ibu.text.isEmpty ||
                            valueGolDar == null ||
                            valueYatim == null ||
                            valueUsaha == null) {
                          // Menampilkan pesan kesalahan jika ada data yang belum terisi
                          customAlert(context, "error",
                              "Pastikan Semua terisi dengan benar");
                        } else {
                          // Semua data sudah terisi, lakukan pengiriman data
                          String statusPernikahan;
                          if (valueNikah == "Ayah") {
                            statusPernikahan = "1";
                          } else if (valueNikah == "Ibu") {
                            statusPernikahan = "2";
                          } else if (valueNikah == "Anak") {
                            statusPernikahan = "3";
                          } else {
                            statusPernikahan = "0";
                          }

                          String statusHubungan;
                          if (valueHubungan == "Belum Kawin") {
                            statusHubungan = "1";
                          } else if (valueHubungan == "Kawin") {
                            statusHubungan = "2";
                          } else if (valueHubungan == "Cerai Hidup") {
                            statusHubungan = "3";
                          } else if (valueHubungan == "Cerai Mati") {
                            statusHubungan = "4";
                          } else {
                            statusHubungan = "0";
                          }

                          final data = {
                            "nomor_kk": nomor_kk.text.toString(),
                            "nik": nik.text.toString(),
                            "nama": nama.text.toString(),
                            "jenis_kelamin": valueJk == "Laki-laki" ? "L" : "P",
                            "tempat_lahir": tempat_lahir.text.toString(),
                            "tanggal_lahir": DateFormat('yyyy-MM-dd')
                                .format(_selectedDate)
                                .toString(),
                            "agama": valueAgama.toString(),
                            "pendidikan": pendidikan.text.toString(),
                            "jenis_pekerjaan": jenis_pekerjaan.text.toString(),
                            "status_pernikahan": statusPernikahan,
                            "status_hubungan_dalam_keluarga": statusHubungan,
                            "kewarganegaraan": kewarganegaraan.text.toString(),
                            "nama_ayah": nama_ayah.text.toString(),
                            "nama_ibu": nama_ibu.text.toString(),
                            "golongan_darah": valueGolDar.toString(),
                            "yatim_piatu": valueYatim.toString(),
                            "memiliki_usaha": valueUsaha.toString(),
                          };
                          createData(context, data, 'anggotakel/add');
                        }
                        // }
                      },
                      child: Text("Simpan",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800))),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color(0xff12AA86).withOpacity(0.7)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
