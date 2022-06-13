import 'dart:convert';

ListGuru listGuruFromJson(String str) => ListGuru.fromJson(json.decode(str));

String listGuruToJson(ListGuru data) => json.encode(data.toJson());

class ListGuru {
  ListGuru({
    required this.status,
    required this.message,
    required this.data,
    required this.teachers,
  });

  String status;
  String message;
  Data data;
  List<Teacher> teachers;

  factory ListGuru.fromJson(Map<String, dynamic> json) => ListGuru(
      status: json["status"],
      message: json["message"],
      data: Data.fromJson(json["data"]),
      teachers: List<Teacher>.from(
          json["data"]["teachers"].map((x) => Teacher.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
      };
}

class Data {
  Data({
    required this.teachers,
  });

  List<Teacher> teachers;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        teachers: List<Teacher>.from(
            json["teachers"].map((x) => Teacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "teachers": List<dynamic>.from(teachers.map((x) => x.toJson())),
      };
}

class Teacher {
  Teacher({
    required this.teacherId,
    required this.name,
    required this.description,
    required this.profilePhotoPath,
    required this.subject,
    required this.rate,
    required this.createdAt,
    required this.updateAt,
  });

  String teacherId;
  String name;
  String description;
  String profilePhotoPath;
  String subject;
  int rate;
  DateTime createdAt;
  DateTime updateAt;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherId: json["teacher_id"],
        name: json["name"],
        description: json["description"],
        profilePhotoPath: json["profile_photo_path"],
        subject: json["subject"],
        rate: json["rate"],
        createdAt: DateTime.parse(json["created_at"]),
        updateAt: DateTime.parse(json["update_at"]),
      );

  Map<String, dynamic> toJson() => {
        "teacher_id": teacherId,
        "name": name,
        "description": description,
        "profile_photo_path": profilePhotoPath,
        "subject": subject,
        "rate": rate,
        "created_at": createdAt.toIso8601String(),
        "update_at": updateAt.toIso8601String(),
      };
}
