class ModelGacoan {
  int? id;
  String? name;
  String? bahan;
  String? caramembuat;

  ModelGacoan(this.id, this.name, this.bahan, this.caramembuat);

  ModelGacoan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bahan = json['bahan'];
    caramembuat = json['cara_membuat'];
  }
}
