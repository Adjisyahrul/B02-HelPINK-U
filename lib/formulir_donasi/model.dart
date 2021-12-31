class Model {
  //int? id;
  late final String bank;
  late final String norekening;
  late final int jmldonasi;

  Model(
      {/*this.id,*/ required this.bank,
      required this.norekening,
      required this.jmldonasi});

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
