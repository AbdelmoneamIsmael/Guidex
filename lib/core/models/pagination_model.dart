class PaginationModel {
  // bool? success;
  // dynamic message;
  int? pageNumber;
  int? pageSize;
  // int? totalCount;
  // int? pageSize;
  // bool? hasPreviousPage;
  // bool? hasNextPage;
  bool? isPagingEnabled;
  // List<dynamic>? data;

  PaginationModel({
    // this.success,
    // this.message,
    // this.currentPage,
    // this.totalPages,
    this.pageNumber=1,
    this.pageSize=10,
    // this.hasPreviousPage,
    // this.hasNextPage,
    this.isPagingEnabled=true,
    // this.data,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      // success: json['success'] as bool?,
      // message: json['message'] as dynamic,
      // currentPage: json['currentPage'] as int?,
      // totalPages: json['totalPages'] as int?,
      pageNumber: json['pageNumber'] as int,
      pageSize: json['pageSize'] as int?,
      isPagingEnabled: json['isPagingEnabled'] as bool?,
      // hasNextPage: json['hasNextPage'] as bool?,
      // data: json['data'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        // 'success': success,
        // 'message': message,
        // 'currentPage': currentPage,
        // 'totalPages': totalPages,
        // 'totalCount': totalCount,
        'pageSize': pageSize,
        'pageNumber': pageNumber,
        'isPagingEnabled': isPagingEnabled,
        // 'data': data,
      };
}
