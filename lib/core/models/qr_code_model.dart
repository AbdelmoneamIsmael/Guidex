import 'package:guidix/core/models/category_model.dart';

class QrModel {
    QrModel({
        required this.id,
        required this.title,
        required this.category,
        required this.describtion,
    });

     String? id;
     String? title;
     Category? category;
     String? describtion;

    QrModel copyWith({
        String? id,
        String? title,
        Category? category,
        String? describtion,
    }) {
        return QrModel(
            id: id ?? this.id,
            title: title ?? this.title,
            category: category ?? this.category,
            describtion: describtion ?? this.describtion,
        );
    }

    factory QrModel.fromJson(Map<String, dynamic> json){ 
        return QrModel(
            id: json["id"],
            title: json["title"],
            category: json["category"] == null ? null : Category.fromJson(json["category"]),
            describtion: json["describtion"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "category": category?.toJson(),
        "describtion": describtion,
    };

    @override
    String toString(){
        return "$id, $title, $category, $describtion, ";
    }
}

