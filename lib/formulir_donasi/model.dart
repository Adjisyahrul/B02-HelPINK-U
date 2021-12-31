class Model {
  //int? id;
   final String bank;
   final String norekening;
   final int jmldonasi;

  Model(
      {/*this.id,*/  this.bank,
       this.norekening,
       this.jmldonasi});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        //id: json['id'],
        bank: json['bank'],
        norekening: json['norekening'],
        jmldonasi: json['jmldonasi']);
  }

  dynamic toJson() => {
        //'id': id,
        'bank': bank,
        'norekening': norekening,
        'jmldonasi': jmldonasi
      };
}