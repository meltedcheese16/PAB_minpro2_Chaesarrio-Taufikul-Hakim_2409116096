class MenuModel {
  final int? id;
  final String namaMenu;
  final int harga;
  final String deskripsi;

  MenuModel({
    this.id,
    required this.namaMenu,
    required this.harga,
    required this.deskripsi,
  });

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      id: json['id'],
      namaMenu: json['nama_menu'],
      harga: json['harga'],
      deskripsi: json['deskripsi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nama_menu': namaMenu,
      'harga': harga,
      'deskripsi': deskripsi,
    };
  }

  MenuModel copyWith({
    int? id,
    String? namaMenu,
    int? harga,
    String? deskripsi,
  }) {
    return MenuModel(
      id: id ?? this.id,
      namaMenu: namaMenu ?? this.namaMenu,
      harga: harga ?? this.harga,
      deskripsi: deskripsi ?? this.deskripsi,
    );
  }
}