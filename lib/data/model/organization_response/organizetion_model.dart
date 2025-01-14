import 'dart:convert';

OrganizationModel organizationModelFromJson(String str) => OrganizationModel.fromJson(json.decode(str));

String organizationModelToJson(OrganizationModel data) => json.encode(data.toJson());

class OrganizationModel {
  bool? result;
  String? message;
  Data? data;

  OrganizationModel({
    this.result,
    this.message,
    this.data,
  });

  factory OrganizationModel.fromJson(Map<String, dynamic> json) => OrganizationModel(
    result: json["result"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  List<Instructor>? instructors;

  Data({
    this.instructors,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    instructors: json["instructors"] == null ? [] : List<Instructor>.from(json["instructors"]!.map((x) => Instructor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "instructors": instructors == null ? [] : List<dynamic>.from(instructors!.map((x) => x.toJson())),
  };
}

class Instructor {
  int? id;
  String? name;
  String? role;
  String? email;
  String? bio;
  int? rating;
  String? image;

  Instructor({
    this.id,
    this.name,
    this.role,
    this.email,
    this.bio,
    this.rating,
    this.image,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    name: json["name"],
    role: json["role"],
    email: json["email"],
    bio: json["bio"],
    rating: json["rating"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "role": role,
    "email": email,
    "bio": bio,
    "rating": rating,
    "image": image,
  };
}
