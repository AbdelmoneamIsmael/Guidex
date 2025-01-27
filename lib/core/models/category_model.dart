class Category {
    Category({
        required this.categoryId,
        required this.categoryName,
    });

     String? categoryId;
     String? categoryName;

    Category copyWith({
        String? categoryId,
        String? categoryName,
    }) {
        return Category(
            categoryId: categoryId ?? this.categoryId,
            categoryName: categoryName ?? this.categoryName,
        );
    }

    factory Category.fromJson(Map<String, dynamic> json){ 
        return Category(
            categoryId: json["categoryId"],
            categoryName: json["CategoryName"],
        );
    }

    Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "CategoryName": categoryName,
    };

    @override
    String toString(){
        return "$categoryId, $categoryName, ";
    }
}
