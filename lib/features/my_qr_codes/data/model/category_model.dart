class CategoryModel {
  CategoryModel({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

  final int? id;
  final String? nameAr;
  final String? nameEn;

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
      nameAr: json["nameAr"],
      nameEn: json["nameEn"],
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
