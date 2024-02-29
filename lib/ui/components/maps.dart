import 'package:data_kependudukan_mobile/data/controllers/mapController.dart';
import 'package:data_kependudukan_mobile/data/model/mapModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double long = 49.5;
  num lat = -0.09;

  bool showCard = false;
  List? selectedLatLong;

  List<LocationData>? locations;
  String? selectedName;
  String? selectednNamaObjek;
  String? selectednRt;
  String? selectednRw;
  String? selectednAlamat;

  @override
  void initState() {
    super.initState();
    getLocation(context).then((value) {
      setState(() {
        locations = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              interactiveFlags: ~InteractiveFlag.doubleTapZoom,
              // onTap: (p) async {
              //   location = await Geocoder.local.findAddressesFromCoordinates(
              //       Coordinates(p.latitude, p.longitude));

              //   setState(() {
              //     point = p;
              //     print(p);
              //   });

              //   print(
              //       "${location.first.countryName} - ${location.first.featureName}");
              // },
              initialCenter: LatLng(-6.3878469, 106.7765979),
              initialZoom: 10.0,
            ),
            children: [
              TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c']),
              MarkerLayer(
                markers: locations?.map((location) {
                      return Marker(
                        width: 100.0,
                        height: 100.0,
                        point: LatLng(location.latitude, location.longitude),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedName = location.namaKK;
                              selectednNamaObjek = location.namaObjek;
                              selectednRt = location.rt;
                              selectednRw = location.rw;
                              selectednAlamat = location.alamat;
                              showCard = true;
                            });
                          },
                          child: Container(
                            child: Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    }).toList() ??
                    [],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: 10, top: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                            )),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15),
                      padding: EdgeInsets.only(
                          left: 20, top: 2, bottom: 3, right: 3),
                      width: 320,
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
                              style: GoogleFonts.nunito(
                                  fontWeight: FontWeight.w400),
                              cursorColor: Color(0xffFBAE3C),
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(top: 10, bottom: 11),
                                border: InputBorder.none,
                                hintText: "Cari Kepala Keluarga",
                                hintStyle: GoogleFonts.nunito(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ],
                ),
                showCard == true && selectedName != null
                    ? Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white),
                        width: 500,
                        // height: 240,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 185, 185),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    "Nama",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 80, 79, 79)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                selectedName ?? "",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 185, 185, 185),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 2),
                                          child: Text(
                                            "Lokasi",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 80, 79, 79)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        selectednNamaObjek ?? "",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 185, 185, 185),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(5),
                                        ),
                                      ),
                                      child: Center(
                                        child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 2),
                                          child: Text(
                                            "Rt/Rw",
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 80, 79, 79)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.only(top: 10),
                                      child: Text(
                                        "$selectednRt/$selectednRw",
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 185, 185, 185),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: Text(
                                    "Alamat",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 80, 79, 79)),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Text(
                                selectednAlamat ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
