import 'package:data_kependudukan_mobile/data/controllers/kepalaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/kepalaKelController.dart';
import 'package:data_kependudukan_mobile/data/model/kepalaKelModel.dart';
import 'package:data_kependudukan_mobile/ui/page/detailKepalaKel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KepalaKeluarga extends StatefulWidget {
  const KepalaKeluarga({super.key});

  @override
  State<KepalaKeluarga> createState() => _KepalaKeluargaState();
}

class _KepalaKeluargaState extends State<KepalaKeluarga> {
  List<KepalaKelData>? kepalaKel;

  @override
  void initState() {
    super.initState();
    getKepalaKel(context).then((value) {
      setState(() {
        kepalaKel = value;
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
                "Kepala Keluarga",
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
            children: kepalaKel?.map((kepalaKel) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DataKeluargaScreen(nomorKK: kepalaKel.nomorKK),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.60,
                            margin: EdgeInsets.only(top: 2),
                            // padding: EdgeInsets.only(top: 5),
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
                                        right: 7),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 5,
                                          bottom: 5,
                                          left: 0,
                                          right: 15),
                                      // child:
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            kepalaKel.namaKK,
                                            textAlign: TextAlign.start,
                                            style: GoogleFonts.quicksand(
                                                textStyle: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 15,
                                                    color: Colors.black87)),
                                          ),
                                          Text(kepalaKel.alamat,
                                              textAlign: TextAlign.start,
                                              style: GoogleFonts.quicksand(
                                                  textStyle: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Colors.black54)))
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height: 29,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(1.1, 1.1),
                                        blurRadius: 10.0),
                                  ],
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 13,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(width: 4),
                                      Text(kepalaKel.desaKelurahan,
                                          style: GoogleFonts.quicksand(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: Colors.black54)))
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                padding: EdgeInsets.only(left: 7),
                                width: MediaQuery.of(context).size.width * 0.24,
                                height: 29,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5.0),
                                      bottomLeft: Radius.circular(5.0),
                                      bottomRight: Radius.circular(5.0),
                                      topRight: Radius.circular(5.0)),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        offset: Offset(1.1, 1.1),
                                        blurRadius: 10.0),
                                  ],
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_pin,
                                        size: 13,
                                        color: Colors.black45,
                                      ),
                                      SizedBox(width: 4),
                                      Text(kepalaKel.kecamatan,
                                          style: GoogleFonts.quicksand(
                                              textStyle: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 10,
                                                  color: Colors.black54)))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
    )));
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class KepalaKeluarga extends StatefulWidget {
//   const KepalaKeluarga({super.key});

//   @override
//   State<KepalaKeluarga> createState() => _KepalaKeluargaState();
// }

// class _KepalaKeluargaState extends State<KepalaKeluarga> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffEFF5FB),
//       body: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 20, left: 50),
//             child: Row(
//               children: [
//                 Icon(Icons.arrow_back_ios),
//                 Text(
//                   "Kepala Keluarga",
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.only(top: 50, left: 30, right: 30),
//               margin: EdgeInsets.only(top: 50),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(70),
//                   topRight: Radius.circular(60),
//                 ),
//                 color: Colors.white,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.5),
//                     spreadRadius: 5,
//                     blurRadius: 7,
//                     offset: Offset(0, 3),
//                   )
//                 ],
//               ),
//               child: ListView(
//                 children: [
//                   _cardWidget(
//                       "data:image/png;base64,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",
//                       "Budi Yanto Hartono",
//                       "Jl. R R I, Sukamaju, Kec. Cilodong, Kota Depok, Jawa Barat 16415"),
//                   _cardWidget(
//                       "data:image/png;base64,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",
//                       "Maman",
//                       "Depok"),
//                   _cardWidget(
//                       "data",
//                       "Mana Rahmana",
//                       "Depok"),
//                   _cardWidget(
//                       "data",
//                       "Mana Rahmana",
//                       "Depok"),
//                   _cardWidget(
//                       "data",
//                       "Mana Rahmana",
//                       "Depok"),
//                   _cardWidget(
//                       "data",
//                       "Mana Rahmana",
//                       "Depok"),
//                   _cardWidget(
//                       "data:",
//                       "Mana Rahmana",
//                       "Depok"),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _cardWidget(
//     String? image,
//     String? nama,
//     String? alamat,
//   ) {
//     return Container(
//       margin: EdgeInsets.only(bottom: 30),
//       child: Row(children: [
//         Container(
//           margin: EdgeInsets.only(left: 20),
//           width: 50,
//           height: 50,
//           child: Image(
//             image: NetworkImage(
//               image ??
//               "data: "
//             ),
//           ),
//         ),
//         Container(
//           width: MediaQuery.of(context).size.width * 0.55,
//           margin: EdgeInsets.only(left: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Flexible(
//                 child: Text(
//                   nama ?? "Budi Yanto Hartono",
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Flexible(
//                   child: Text(
//                 alamat ??
//                     "Jl. RRI, Sukamaju, Kec. Cilodong, Kota Depok, Jawa Barat 16415",
//                 maxLines: null,
//               ))
//             ],
//           ),
//         )
//       ]),
//       height: 80,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.4),
//             spreadRadius: 2,
//             blurRadius: 7,
//             offset: Offset(0, 5),
//           )
//         ],
//       ),
//     );
//   }
// }
