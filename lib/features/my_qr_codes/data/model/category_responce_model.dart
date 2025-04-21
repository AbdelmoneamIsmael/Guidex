import 'package:guidix/features/my_qr_codes/data/model/category_model.dart';

class CategoryResponceModel {
  CategoryResponceModel({
    required this.pageIndex,
    required this.pageSize,
    required this.count,
    required this.pagesCount,
    required this.itemsCount,
    required this.hasPreviousPage,
    required this.hasNextPage,
    required this.data,
  });

  final num? pageIndex;
  final num? pageSize;
  final num? count;
  final num? pagesCount;
  final num? itemsCount;
  final bool? hasPreviousPage;
  final bool? hasNextPage;
  final List<CategoryModel> data;

  CategoryResponceModel copyWith({
    num? pageIndex,
    num? pageSize,
    num? count,
    num? pagesCount,
    num? itemsCount,
    bool? hasPreviousPage,
    bool? hasNextPage,
    List<CategoryModel>? data,
  }) {
    return CategoryResponceModel(
      pageIndex: pageIndex ?? this.pageIndex,
      pageSize: pageSize ?? this.pageSize,
      count: count ?? this.count,
      pagesCount: pagesCount ?? this.pagesCount,
      itemsCount: itemsCount ?? this.itemsCount,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      data: data ?? this.data,
    );
  }

  factory CategoryResponceModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponceModel(
      pageIndex: json["pageIndex"],
      pageSize: json["pageSize"],
      count: json["count"],
      pagesCount: json["pagesCount"],
      itemsCount: json["itemsCount"],
      hasPreviousPage: json["hasPreviousPage"],
      hasNextPage: json["hasNextPage"],
      data: json["data"] == null
          ? []
          : List<CategoryModel>.from(
              json["data"]!.map((x) => CategoryModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "pageIndex": pageIndex,
        "pageSize": pageSize,
        "count": count,
        "pagesCount": pagesCount,
        "itemsCount": itemsCount,
        "hasPreviousPage": hasPreviousPage,
        "hasNextPage": hasNextPage,
        "data": data.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$pageIndex, $pageSize, $count, $pagesCount, $itemsCount, $hasPreviousPage, $hasNextPage, $data, ";
  }
}
