class KepalaKelData {
  final int id;
  final String nomorKK;
  final String namaKK;
  final String alamat;
  final String rt;
  final String rw;
  final String desaKelurahan;
  final String kecamatan;
  final String kota;
  final String provinsi;
  final int idLokasiObjek;
  final String pic;

  KepalaKelData({
    required this.id,
    required this.nomorKK,
    required this.namaKK,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.desaKelurahan,
    required this.kecamatan,
    required this.kota,
    required this.provinsi,
    required this.idLokasiObjek,
    required this.pic,
  });

  factory KepalaKelData.fromJson(Map<Object, dynamic> json) {
    return KepalaKelData(
      id: json['id'],
      nomorKK: json['nomor_kk'],
      namaKK: json['nama_kk'],
      alamat: json['alamat'],
      rt: json['rt'],
      rw: json['rw'],
      desaKelurahan: json['desa_kelurahan'],
      kecamatan: json['kecamatan'],
      kota: json['kota'],
      provinsi: json['provinsi'],
      idLokasiObjek: json['id_lokasi_objek']??0??'',
      pic: json['pic'],
    );
  }
}
