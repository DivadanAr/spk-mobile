class LocationData {
  final int id;
  final String nomorKK;
  final String namaKK;
  final String namaObjek;
  final String jenisObjek;
  final String identitasObjek;
  final String alamat;
  final String rt;
  final String rw;
  final String desaKelurahan;
  final String kecamatan;
  final String kotaKab;
  final String provinsi;
  final double latitude;
  final double longitude;
  final String pic;

  LocationData({
    required this.id,
    required this.nomorKK,
    required this.namaKK,
    required this.namaObjek,
    required this.jenisObjek,
    required this.identitasObjek,
    required this.alamat,
    required this.rt,
    required this.rw,
    required this.desaKelurahan,
    required this.kecamatan,
    required this.kotaKab,
    required this.provinsi,
    required this.latitude,
    required this.longitude,
    required this.pic,
  });

  factory LocationData.fromJson(Map<String, dynamic> json) {
    return LocationData(
      id: int.parse(json['id']),
      nomorKK: json['nomor_kk'],
      namaKK: json['nama_kk'],
      namaObjek: json['nama_objek'],
      jenisObjek: json['jenis_objek'],
      identitasObjek: json['identitas_objek'],
      alamat: json['alamat'],
      rt: json['rt'],
      rw: json['rw'],
      desaKelurahan: json['desa_kelurahan'],
      kecamatan: json['kecamatan'],
      kotaKab: json['kota_kab'],
      provinsi: json['provinsi'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      pic: json['pic'],
    );
  }
}
