class QrCodeGeenerationModel {
    QrCodeGeenerationModel({
        required this.qrCodeId,
        required this.nameEn,
        required this.nameAr,
        required this.describtonEn,
        required this.descriptionAr,
    });

     String? qrCodeId;
     String? nameEn;
     String? nameAr;
     String? describtonEn;
     String? descriptionAr;

    QrCodeGeenerationModel copyWith({
        String? qrCodeId,
        String? nameEn,
        String? nameAr,
        String? describtonEn,
        String? descriptionAr,
    }) {
        return QrCodeGeenerationModel(
            qrCodeId: qrCodeId ?? this.qrCodeId,
            nameEn: nameEn ?? this.nameEn,
            nameAr: nameAr ?? this.nameAr,
            describtonEn: describtonEn ?? this.describtonEn,
            descriptionAr: descriptionAr ?? this.descriptionAr,
        );
    }

    factory QrCodeGeenerationModel.fromJson(Map<String, dynamic> json){ 
        return QrCodeGeenerationModel(
            qrCodeId: json["qrCodeID"],
            nameEn: json["nameEn"],
            nameAr: json["nameAr"],
            describtonEn: json["describtonEn"],
            descriptionAr: json["descriptionAr"],
        );
    }

    Map<String, dynamic> toJson() => {
        "qrCodeID": qrCodeId,
        "nameEn": nameEn,
        "nameAr": nameAr,
        "describtonEn": describtonEn,
        "descriptionAr": descriptionAr,
    };

    @override
    String toString(){
        return "$qrCodeId, $nameEn, $nameAr, $describtonEn, $descriptionAr, ";
    }
}
