class ModelGoreng {
  int? id;
  String? name;
  String? bahan;
  String? caramembuat;

  ModelGoreng(this.id, this.name, this.bahan, this.caramembuat);

  ModelGoreng.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bahan = json['bahan'];
    caramembuat = json['cara_membuat'];
  }
}
