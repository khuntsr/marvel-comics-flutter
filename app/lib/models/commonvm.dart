import 'dart:convert';

ResponseVm responseVmFromJson(String str) => ResponseVm.fromJson(json.decode(str));
String responseVmToJson(ResponseVm data) => json.encode(data.toJson());

class ResponseVm {
  ResponseVm({required this.message, required this.success});

  String message;
  bool success;

  factory ResponseVm.fromJson(Map<String, dynamic> json) => ResponseVm(message: json["message"], success: json["success"]);

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}