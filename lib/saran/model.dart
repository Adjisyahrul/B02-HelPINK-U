class Model{
  //int? id;
  final String role;
  final String keluhan;
  final String pesan;
  final String rating;

  Model({
    /*this.id,*/this.role, this.keluhan, this.pesan, this.rating
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