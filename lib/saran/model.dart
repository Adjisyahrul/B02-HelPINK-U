class Model{
  //int? id;
  late final String role;
  late final String keluhan;
  late final String pesan;
  late final String rating;

  Model({
    /*this.id,*/ required this.role, required this.keluhan, required this.pesan, required this.rating
  });

  factory Model.fromJson(Map<String, dynamic> json){
    return Model(
      //id: json['id'],
      role: json['role'], 
      keluhan: json['keluhan'], 
      pesan: json['pesan'], 
      rating: json['rating']);
  }

  dynamic toJson()=>{
    //'id': id,
    'role': role,
    'keluhan': keluhan,
    'pesan': pesan,
    'rating': rating
  };
}