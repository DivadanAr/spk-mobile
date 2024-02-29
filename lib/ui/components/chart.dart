import 'package:data_kependudukan_mobile/data/controllers/anggotaKelController.dart';
import 'package:data_kependudukan_mobile/data/controllers/kepalaKelController.dart';
import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic/graphic.dart' as graphic;
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomBarChart extends StatefulWidget {
  const CustomBarChart({super.key});

  @override
  State<StatefulWidget> createState() => CustomBarChartState();
}

class CustomBarChartState extends State<CustomBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Jumlah Keluarga Kecamatan",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black26,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 300,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FutureBuilder<List<Map<String, dynamic>>>(
                    future: getKepalaKelKecamatan(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Chart(
                            data: snapshot.data!,
                            variables: {
                              'Kec': Variable(
                                accessor: (Map map) => map['Kec'] as String,
                              ),
                              'Anggota': Variable(
                                accessor: (Map map) => map['Anggota'] as num,
                              ),
                            },
                            marks: [
                              IntervalMark(
                                label: LabelEncode(
                                  encoder: (tuple) =>
                                      Label(tuple['Anggota'].toString()),
                                ),
                                elevation: ElevationEncode(value: 0, updaters: {
                                  'tap': {true: (_) => 5}
                                }),
                                color: ColorEncode(
                                  value: Color(0xff12AA86).withOpacity(0.7),
                                  updaters: {
                                    'tap': {
                                      false: (color) => color.withAlpha(100)
                                    }
                                  },
                                ),
                              )
                            ],
                            axes: [
                              Defaults.horizontalAxis,
                              Defaults.verticalAxis,
                            ],
                            selections: {'tap': PointSelection(dim: Dim.x)},
                            tooltip: TooltipGuide(),
                            crosshair: CrosshairGuide(),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Text('No data');
                        }
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRadialChart extends StatefulWidget {
  const CustomRadialChart({super.key});

  @override
  State<StatefulWidget> createState() => CustomRadialChartState();
}

class CustomRadialChartState extends State<CustomRadialChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  int totalJenisPpksNotNull = 0;
  int totalJenisPsksNotNull = 0;
  int totalJenisBansosNotNull = 0;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
    calculateTotal(context);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 30),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.1),
            offset: Offset(0, 2),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Jumlah Penduduk Pemerlu",
                style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w800, fontSize: 16),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black26,
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff77CBB0),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  totalJenisBansosNotNull.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      height: 1),
                                )),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Bansos",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xff80EB76).withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  totalJenisPpksNotNull.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      height: 1),
                                )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "PPKS",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Color(0xffC0DFBD),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Center(
                                    child: Text(
                                  totalJenisPsksNotNull.toString(),
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w800,
                                      height: 1),
                                )),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "PSKS",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    height: 1),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 350,
                      height: 300,
                      child: SfCircularChart(
                        legend: Legend(
                            isVisible: false,
                            overflowMode: LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          RadialBarSeries<GDPData, String>(
                              dataSource: _chartData,
                              xValueMapper: (GDPData data, _) => data.continent,
                              yValueMapper: (GDPData data, _) => data.gdp,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              enableTooltip: false,
                              pointColorMapper: (GDPData data, _) {
                                int index = _chartData.indexOf(data);
                                if (index % 3 == 0) {
                                  return Color(0xFFC0DFBD);
                                } else if (index % 3 == 1) {
                                  return Color(0xFF80EB76).withOpacity(0.5);
                                } else {
                                  return Color(0xFF12AA86).withOpacity(0.5);
                                }
                              },
                              maximumValue: 14)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('PPKS', totalJenisPsksNotNull),
      GDPData('PSKS', totalJenisPpksNotNull),
      GDPData('BANSOS', totalJenisBansosNotNull),
    ];
    return chartData;
  }

  void calculateTotal(BuildContext context) async {
    List<AnggoraKeluargaPemerlu> anggotaKeluarga =
        await getAnggotaKelPemerlu(context);

    totalJenisPpksNotNull =
        anggotaKeluarga.where((anggota) => anggota.jenisPpks != "null").length;
    totalJenisPsksNotNull =
        anggotaKeluarga.where((anggota) => anggota.jenisPsks != "null").length;
    totalJenisBansosNotNull = anggotaKeluarga
        .where((anggota) => anggota.jenisBansos != "null")
        .length;

    _chartData =
        getChartData(); // Inisialisasi _chartData setelah perhitungan total selesai

    setState(() {});
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
