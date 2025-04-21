class CategoryModel {
  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  int? id;
  String? nameAr;
  String? nameEn;

  CategoryModel copyWith({
    int? id,
    String? nameAr,
    String? nameEn,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
    );
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      nameAr: json["nameAr"].isEmpty ? json["nameEn"] : json["nameAr"],
      nameEn: json["nameEn"].isEmpty ? json["nameAr"] : json["nameEn"],
    );
  }
  factory CategoryModel.empty() {
    return CategoryModel(
      id: -1,
      nameAr: "الجميع",
      nameEn: "all",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameAr": nameAr,
        "nameEn": nameEn,
      };

  @override
  String toString() {
    return "$id, $nameAr, $nameEn, ";
  }
}
