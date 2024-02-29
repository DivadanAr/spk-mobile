import 'package:data_kependudukan_mobile/data/controllers/anggotaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/kepalaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/logincontroller.dart';
import 'package:data_kependudukan_mobile/data/controllers/mergeDataKel.dart';
import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:data_kependudukan_mobile/data/model/kepalaKelModel.dart';
import 'package:data_kependudukan_mobile/ui/components/card.dart';
import 'package:data_kependudukan_mobile/ui/components/chart.dart';
import 'package:data_kependudukan_mobile/ui/components/maps.dart';
import 'package:data_kependudukan_mobile/ui/page/anggotaKeluargaPage.dart';
import 'package:data_kependudukan_mobile/ui/page/kepalaKeluargaPage.dart';
import 'package:data_kependudukan_mobile/ui/page/login.dart';
import 'package:data_kependudukan_mobile/ui/page/wilayahPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late SharedPreferences preferences;
  List<AnggotaKelData>? anggotaKel;
  List<KepalaKelData>? kepalaKel;

  @override
  void initState() {
    super.initState();
    initPreferences();
    getAnggotaKel(context).then((value) {
      setState(() {
        anggotaKel = value;
        print(anggotaKel.toString());
      });
    });
    getKepalaKel(context).then((value) {
      setState(() {
        kepalaKel = value;
      });
    });
  }

  Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    // Now you can use `preferences` safely
  }

  void logout() {
    preferences.clear();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    int jumlahAnggota = anggotaKel?.length ?? 0;
    int jumlahKepala = kepalaKel?.length ?? 0;
    int jumlah = jumlahAnggota + jumlahKepala;
    print(jumlah.toString());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Hallo! Selamat Datang!",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                height: 1),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Berikut Data Kependudukan",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        child: IconButton(
                            onPressed: () => logout(),
                            icon: Icon(Icons.logout)))
                  ],
                ),

                CustomBarChart(),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: 20),
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
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        height: 65,
                        margin:
                            EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                        decoration: BoxDecoration(
                            color: Color(0xff57A94F).withOpacity(0.21),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$jumlah",
                              style: GoogleFonts.nunito(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Penduduk",
                              style: GoogleFonts.nunito(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Jumlah Penduduk",
                            style: GoogleFonts.nunito(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          Text(
                            "Update Data : 8 Februari 2023",
                            style: GoogleFonts.nunito(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MapPage()));
                          },
                          icon: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
                // CustomCarousel()
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
                  width: double.maxFinite,
                  height: 255,
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 23.0,
                      crossAxisSpacing: 23.0,
                      // childAspectRatio: 1.0,
                    ),
                    children: [
                      CustomCard(
                        asset: "assets/kepalakel.png",
                        label: "Kepala Keluarga",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => KepalaKeluarga()));
                        },
                      ),
                      CustomCard(
                        asset: "assets/anggotakel.png",
                        label: "Anggota Keluarga",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnggotaKeluargaPage()));
                        },
                      ),
                      CustomCard(
                        asset: "assets/wilayah.png",
                        label: "Data Wilayah",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WilayahPage()));
                        },
                      ),
                      CustomCard(
                        asset: "assets/psks.png",
                        label: "Data PSKS",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnggotaKeluargaPage()));
                        },
                      ),
                      CustomCard(
                        asset: "assets/ppks.png",
                        label: "Data PPKS",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnggotaKeluargaPage()));
                        },
                      ),
                      CustomCard(
                        asset: "assets/bansos.png",
                        label: "Data Bansos",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnggotaKeluargaPage()));
                        },
                      ),
                    ],
                  ),
                ),
                CustomRadialChart()
              ]),
        ),
      ),
    );
  }
}
