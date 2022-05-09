import 'dart:convert';

class SessionVm {
  SessionVm({
    required this.userId,
    required this.email
  });

  String userId;
  String email;

  factory SessionVm.fromRawJson(String str) => SessionVm.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SessionVm.fromJson(Map<String, dynamic> json) => SessionVm(
    userId: json["UserID"],
    email: json["RoleID"],
  );

  Map<String, dynamic> toJson() => {
    "UserID": userId,
    "UserId": userId,
  };
}
