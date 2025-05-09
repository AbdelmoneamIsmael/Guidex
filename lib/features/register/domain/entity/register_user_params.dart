class RegesterUserParams {
  RegesterUserParams({
    required this.phone,
    required this.name,
    required this.email,
    required this.password,
  });

  final String? name;
  final String? email;
  final String? phone;
  final String? password;

  RegesterUserParams copyWith({
    String? name,
    String? email,
    String? password,
    String? phone,
  }) {
    return RegesterUserParams(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  factory RegesterUserParams.fromJson(Map<String, dynamic> json) {
    return RegesterUserParams(
      phone: json["PhoneNumber"],
      name: json["Name"],
      email: json["Email"],
      password: json["Password"],
    );
  }

  Map<String, dynamic> toJson() => {
        "PhoneNumber": phone,
        "Name": name,
        "Email": email,
        "Password": password,
      };

  @override
  String toString() {
    return "$name, $email, $password, $phone";
  }
}
