class QrcodeModel {
  QrcodeModel({
    required this.code,
    required this.imageUrl,
    required this.nameAr,
    required this.nameEn,
    required this.descriptionAr,
    required this.descriptionEn,
    required this.categoryId,
    required this.categoryNameAr,
    required this.categoryNameEn,
    required this.userId,
    required this.userName,
    required this.isReserved,
  });

  String? code;
  String? imageUrl;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  num? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  num? userId;
  String? userName;
  bool? isReserved;

  QrcodeModel copyWith({
    String? code,
    String? imageUrl,
    String? nameAr,
    String? nameEn,
    String? descriptionAr,
    String? descriptionEn,
    num? categoryId,
    String? categoryNameAr,
    String? categoryNameEn,
    num? userId,
    String? userName,
    bool? isReserved,
  }) {
    return QrcodeModel(
      code: code ?? this.code,
      imageUrl: imageUrl ?? this.imageUrl,
      nameAr: nameAr ?? this.nameAr,
      nameEn: nameEn ?? this.nameEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      categoryId: categoryId ?? this.categoryId,
      categoryNameAr: categoryNameAr ?? this.categoryNameAr,
      categoryNameEn: categoryNameEn ?? this.categoryNameEn,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      isReserved: isReserved ?? this.isReserved,
    );
  }

  factory QrcodeModel.fromJson(Map<String, dynamic> json) {
    return QrcodeModel(
      code: json["code"],
      imageUrl: json["imageUrl"],
      nameAr: json["nameAr"],
      nameEn: json["nameEn"],
      descriptionAr: json["descriptionAr"],
      descriptionEn: json["descriptionEn"],
      categoryId: json["categoryId"],
      categoryNameAr: json["categoryNameAr"],
      categoryNameEn: json["categoryNameEn"],
      userId: json["userId"],
      userName: json["userName"],
      isReserved: json["isReserved"],
    );
  }

  Map<String, dynamic> toJson() => {
        "code": code,
        "imageUrl": imageUrl,
        "nameAr": nameAr,
        "nameEn": nameEn,
        "descriptionAr": descriptionAr,
        "descriptionEn": descriptionEn,
        "categoryId": categoryId,
        "categoryNameAr": categoryNameAr,
        "categoryNameEn": categoryNameEn,
        "userId": userId,
        "userName": userName,
        "isReserved": isReserved,
      };

  @override
  String toString() {
    return "$code, $imageUrl, $nameAr, $nameEn, $descriptionAr, $descriptionEn, $categoryId, $categoryNameAr, $categoryNameEn, $userId, $userName, $isReserved, ";
  }
}
