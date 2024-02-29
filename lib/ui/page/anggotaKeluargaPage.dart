import 'package:data_kependudukan_mobile/data/controllers/anggotaKelController.dart';
import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:data_kependudukan_mobile/data/model/kepalaKelModel.dart';
import 'package:data_kependudukan_mobile/ui/page/form/formAnggotaKel.dart';
import 'package:data_kependudukan_mobile/ui/page/form/formEditAnggotaKel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnggotaKeluargaPage extends StatefulWidget {
  const AnggotaKeluargaPage({super.key});

  @override
  State<AnggotaKeluargaPage> createState() => _AnggotaKeluargaPageState();
}

class _AnggotaKeluargaPageState extends State<AnggotaKeluargaPage> {
  List<AnggotaKelData>? anggotaKel;

  @override
  void initState() {
    super.initState();
    getAnggotaKel(context).then((value) {
      setState(() {
        anggotaKel = value;
        print(anggotaKel.toString());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                Text(
                  "Anggota Keluarga",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.nunito(
                      fontSize: 18, fontWeight: FontWeight.w600, height: 1),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.only(left: 20, top: 2, bottom: 3, right: 3),
              width: double.maxFinite,
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
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 20,
                    color: Color.fromARGB(255, 171, 171, 171),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: GoogleFonts.nunito(fontWeight: FontWeight.w400),
                      cursorColor: Color(0xffFBAE3C),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 10, bottom: 11),
                        border: InputBorder.none,
                        hintText: "Cari Kepala Keluarga",
                        hintStyle:
                            GoogleFonts.nunito(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  SizedBox()
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(
              children: anggotaKel?.map((anggotaKel) {
                    return Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: 70,
                              height: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                    color: Color.fromARGB(255, 185, 207, 241),
                                    width: 3.5),
                                color: Colors.white,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  anggotaKel.jenisKelamin == "P"
                                      ? "assets/anak-cewe.png"
                                      : "assets/anak-laki.png",
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 9,
                            child: Container(
                              margin: EdgeInsets.only(top: 2),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.0),
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topRight: Radius.circular(8.0)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      offset: Offset(1.1, 1.1),
                                      blurRadius: 10.0),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 12,
                                          top: 12,
                                          left: 15,
                                          right: 3),
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 5,
                                            bottom: 5,
                                            left: 0,
                                            right: 15),
                                        // child:
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  anggotaKel.nama,
                                                  textAlign: TextAlign.start,
                                                  style: GoogleFonts.quicksand(
                                                      textStyle: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 14,
                                                          color:
                                                              Colors.black87)),
                                                ),
                                                Text(anggotaKel.nik,
                                                    textAlign: TextAlign.start,
                                                    style: GoogleFonts.quicksand(
                                                        textStyle: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 11,
                                                            color: Colors
                                                                .black54)))
                                              ],
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              width: 30,
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff76CBB0),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                FormDetailAnggotaKel(id: anggotaKel.id,)));
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .arrow_forward_ios_sharp,
                                                    size: 16,
                                                    color: Colors.white,
                                                  )),
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList() ??
                  [
                    Center(
                      child: CircularProgressIndicator(),
                    )
                  ],
            ))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FormAnggotaKel()));
        },
        backgroundColor: Color(0xff12AA86).withOpacity(0.7),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
