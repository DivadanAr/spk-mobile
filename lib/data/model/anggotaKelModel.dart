class AnggotaKelData {
  final int id;
  final String nomorKK;
  final String nik;
  final String nama;
  final String jenisKelamin;
  final String tempatLahir;
  final DateTime tanggalLahir;
  final String agama;
  final String pendidikan;
  final String jenisPekerjaan;
  final String statusPernikahan;
  final String statusHubunganDalamKeluarga;
  final String kewarganegaraan;
  final String namaAyah;
  final String namaIbu;
  final String golonganDarah;
  final String yatimPiatu;
  final String memilikiUsaha;
  final String pic;

  AnggotaKelData({
    required this.id,
    required this.nomorKK,
    required this.nik,
    required this.nama,
    required this.jenisKelamin,
    required this.tempatLahir,
    required this.tanggalLahir,
    required this.agama,
    required this.pendidikan,
    required this.jenisPekerjaan,
    required this.statusPernikahan,
    required this.statusHubunganDalamKeluarga,
    required this.kewarganegaraan,
    required this.namaAyah,
    required this.namaIbu,
    required this.golonganDarah,
    required this.yatimPiatu,
    required this.memilikiUsaha,
    required this.pic,
  });

  factory AnggotaKelData.fromJson(Map<Object, dynamic> json) {
    return AnggotaKelData(
      id: json['id'],
      nomorKK: json['nomor_kk'],
      nik: json['nik'],
      nama: json['nama'],
      jenisKelamin: json['jenis_kelamin'],
      tempatLahir: json['tempat_lahir'],
      tanggalLahir: DateTime.parse(json['tanggal_lahir']),
      agama: json['agama'],
      pendidikan: json['pendidikan'],
      jenisPekerjaan: json['jenis_pekerjaan'],
      statusPernikahan: json['status_pernikahan'],
      statusHubunganDalamKeluarga: json['status_hubungan_dalam_keluarga'],
      kewarganegaraan: json['kewarganegaraan'],
      namaAyah: json['nama_ayah'],
      namaIbu: json['nama_ibu'],
      golonganDarah: json['golongan_darah'],
      yatimPiatu: json['yatim_piatu'],
      memilikiUsaha: json['memiliki_usaha'],
      pic: json['pic'] ?? "",
    );
  }

  get kecamatan => null;
}

class AnggoraKeluargaPemerlu {
  final int id;
  final String nomorKK;
  final String nik;
  final String nama;
  final String tglLahir;
  final String jenisPpks;
  final String jenisPsks;
  final String jenisBansos;

  AnggoraKeluargaPemerlu({
    required this.id,
    required this.nomorKK,
    required this.nik,
    required this.nama,
    required this.tglLahir,
    required this.jenisPpks,
    required this.jenisPsks,
    required this.jenisBansos,
  });

  factory AnggoraKeluargaPemerlu.fromJson(Map<Object, dynamic> json) {
    return AnggoraKeluargaPemerlu(
      id: json['id'],
      nomorKK: json['nomor_kk'],
      nik: json['nik'],
      nama: json['nama'],
      tglLahir: json['tanggal_lahir'],
      jenisPpks: json['jenis_ppks'],
      jenisPsks: json['jenis_psks'],
      jenisBansos: json['jenis_bansos'],
    );
  }
}
