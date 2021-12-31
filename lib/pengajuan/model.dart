class Model{
  late final String nama;
  late final String tipePengajuan;
  late final String latar;
  late final String lokasi;
  late final String status;

  Model({
    required this.nama, required this.tipePengajuan, required this.latar, required this.lokasi, required this.status
  });

  factory Model.fromJson(Map<String, dynamic> json){
    return Model(
      nama: json['nama'], 
      tipePengajuan: json['tipe'], 
      latar: json['latar'], 
      lokasi: json['lokasi'],
      status: json['status']);
  }

  dynamic toJson()=>{
    'nama': nama,
    'tipe': tipePengajuan,
    'latar': latar,
    'lokasi': lokasi,
    'status': status,
  };
}