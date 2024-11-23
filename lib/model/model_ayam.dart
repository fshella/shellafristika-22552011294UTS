class ModelAyam {
  int? id;
  String? name;
  String? bahan;
  String? caramembuat;

  ModelAyam(this.id, this.name, this.bahan, this.caramembuat);

  ModelAyam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bahan = json['bahan'];
    caramembuat = json['cara_membuat'];
  }
}
