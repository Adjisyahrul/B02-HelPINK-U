class Model{
   final String nama;
   final String tipePengajuan;
   final String latar;
   final String lokasi;
   final String status;

  Model({
    this.nama,  this.tipePengajuan,  this.latar, this.lokasi,  this.status
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