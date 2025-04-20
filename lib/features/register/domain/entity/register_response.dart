class RegesterResponseModel {
  RegesterResponseModel({
    required this.success,
    required this.data,
    required this.message,
  });

  final bool? success;
  final dynamic data;
  final String? message;

  RegesterResponseModel copyWith({
    bool? success,
    dynamic? data,
    String? message,
  }) {
    return RegesterResponseModel(
      success: success ?? this.success,
      data: data ?? this.data,
      message: message ?? this.message,
    );
  }

  factory RegesterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegesterResponseModel(
      success: json["success"],
      data: json["data"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data,
        "message": message,
      };

  @override
  String toString() {
    return "$success, $data, $message, ";
  }
}
