import 'package:data_kependudukan_mobile/data/model/anggotaKelModel.dart';
import 'package:data_kependudukan_mobile/data/model/kepalaKelModel.dart';

class MergeDataKel {
  final List<KepalaKelData> kepalaKeluarga;
  final List<AnggotaKelData> anggotaKeluarga;

  MergeDataKel({
    required this.kepalaKeluarga,
    required this.anggotaKeluarga,
  });

  factory MergeDataKel.fromJson(Map<String, dynamic> json) {
    List<KepalaKelData> kepalaKeluarga = List<KepalaKelData>.from(json['data']
            ['KepalaKeluarga']
        .map((model) => KepalaKelData.fromJson(model)));
    List<AnggotaKelData> anggotaKeluarga = List<AnggotaKelData>.from(
        json['data']['AnggotaKeluarga']
            .map((model) => AnggotaKelData.fromJson(model)));

    return MergeDataKel(
      kepalaKeluarga: kepalaKeluarga,
      anggotaKeluarga: anggotaKeluarga,
    );
  }
}
