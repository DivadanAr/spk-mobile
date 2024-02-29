import 'package:data_kependudukan_mobile/data/controllers/anggotaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/crud.dart';
import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:data_kependudukan_mobile/ui/components/alert.dart';
import 'package:data_kependudukan_mobile/ui/components/customInput.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormDetailAnggotaKel extends StatefulWidget {
  final id;
  const FormDetailAnggotaKel({super.key, this.id});

  @override
  State<FormDetailAnggotaKel> createState() => _FormDetailAnggotaKelState();
}

class _FormDetailAnggotaKelState extends State<FormDetailAnggotaKel> {
  final nomor_kk = TextEditingController();
  final nik = TextEditingController();
  final nama = TextEditingController();
  final tempat_lahir = TextEditingController();
  final pendidikan = TextEditingController();
  final jenis_pekerjaan = TextEditingController();
  final jenis_kelamin = TextEditingController();
  final kewarganegaraan = TextEditingController();
  final nama_ayah = TextEditingController();
  final nama_ibu = TextEditingController();

  final valueAgama = TextEditingController();
  final valueGolDar = TextEditingController();
  final valueNikah = TextEditingController();
  final valueUsaha = TextEditingController();
  final valueYatim = TextEditingController();
  final valueHubungan = TextEditingController();
  final _selectedDate = TextEditingController();
  bool selectDate = false;

  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? pickedDate = await showDatePicker(
  //     context: context,
  //     initialDate: _selectedDate,
  //     firstDate: DateTime(2015),
  //     lastDate: DateTime(2100),
  //   );
  //   if (pickedDate != null && pickedDate != _selectedDate) {
  //     setState(() {
  //       _selectedDate = pickedDate;
  //     });
  //   }
  // }

  List<AnggotaKelData>? anggotaKel;

  @override
  void initState() {
    super.initState();
    getAnggotaKelDetail(context, this.widget.id.toString()).then((value) {
      setState(() {
        anggotaKel = value;
        if (anggotaKel != null && anggotaKel!.isNotEmpty) {
          // Jika anggotaKel sudah terisi, isi nilai input dengan data dari anggotaKel
          nomor_kk.text = anggotaKel![0].nomorKK;
          nik.text = anggotaKel![0].nik;
          nama.text = anggotaKel![0].nama;
          tempat_lahir.text = anggotaKel![0].tempatLahir;
          pendidikan.text = anggotaKel![0].pendidikan;
          jenis_pekerjaan.text = anggotaKel![0].jenisPekerjaan;
          kewarganegaraan.text = anggotaKel![0].kewarganegaraan;
          nama_ayah.text = anggotaKel![0].namaAyah;
          nama_ibu.text = anggotaKel![0].namaIbu;
          jenis_kelamin.text = anggotaKel![0].jenisKelamin;
          valueAgama.text = anggotaKel![0].agama;
          valueGolDar.text = anggotaKel![0].golonganDarah;
          valueNikah.text = anggotaKel![0].statusPernikahan;
          valueUsaha.text = anggotaKel![0].memilikiUsaha;
          valueYatim.text = anggotaKel![0].yatimPiatu;
          valueHubungan.text = anggotaKel![0].statusHubunganDalamKeluarga;
          _selectedDate.text = anggotaKel![0].tanggalLahir.toString();
        }
      });
    });
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
                  CustomField(
                      label: "Jenis Kelamin", controller: jenis_kelamin),
                  CustomField(label: "Tempat Lahir", controller: tempat_lahir),
                  CustomField(
                      label: "Tanggal Lahir", controller: _selectedDate),
                  CustomField(label: "Agama", controller: valueAgama),
                  CustomField(label: "Pendidikan", controller: pendidikan),
                  CustomField(
                      label: "Jenis Pekerjaan", controller: jenis_pekerjaan),
                  CustomField(
                      label: "Status Pernikahan", controller: valueNikah),
                  CustomField(
                      label: "Status Hubungan", controller: valueHubungan),
                  CustomField(
                      label: "Kewarganegaraan", controller: kewarganegaraan),
                  CustomField(label: "Nama Ayah", controller: nama_ayah),
                  CustomField(label: "Nama Ibu", controller: nama_ibu),
                  CustomField(label: "Golongan Darah", controller: valueGolDar),
                  CustomField(label: "Yatim Piatu", controller: valueYatim),
                  CustomField(label: "Memiliki usaha", controller: valueUsaha),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (nomor_kk.text.isEmpty ||
                            nik.text.isEmpty ||
                            nama.text.isEmpty ||
                            tempat_lahir.text.isEmpty ||
                            pendidikan.text.isEmpty ||
                            jenis_pekerjaan.text.isEmpty ||
                            kewarganegaraan.text.isEmpty ||
                            nama_ayah.text.isEmpty ||
                            nama_ibu.text.isEmpty) {
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
                            "jenis_kelamin": jenis_kelamin.toString(),
                            "tempat_lahir": tempat_lahir.text.toString(),
                            "tanggal_lahir": DateFormat('yyyy-MM-dd')
                                .format(DateTime.parse(_selectedDate.text))
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
                      child: Text("Simpan Perubahan",
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
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        deleteData(context, 'anggotakel/delete/'+this.widget.id.toString());
                      },
                      child: Text("Hapus",
                          style: GoogleFonts.nunito(
                              textStyle: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800))),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 255, 46, 46).withOpacity(0.7)),
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
