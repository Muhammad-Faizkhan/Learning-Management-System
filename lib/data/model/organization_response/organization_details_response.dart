// To parse this JSON data, do
//
//     final organizationDetailsModel = organizationDetailsModelFromJson(jsonString);

import 'dart:convert';

OrganizationDetailsModel organizationDetailsModelFromJson(String str) => OrganizationDetailsModel.fromJson(json.decode(str));

String organizationDetailsModelToJson(OrganizationDetailsModel data) => json.encode(data.toJson());

class OrganizationDetailsModel {
  bool? result;
  String? message;
  Data? data;

  OrganizationDetailsModel({
    this.result,
    this.message,
    this.data,
  });

  factory OrganizationDetailsModel.fromJson(Map<String, dynamic> json) => OrganizationDetailsModel(
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
  Organization? organization;

  Data({
    this.organization,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    organization: json["organization"] == null ? null : Organization.fromJson(json["organization"]),
  );

  Map<String, dynamic> toJson() => {
    "organization": organization?.toJson(),
  };
}

class Organization {
  int? id;
  String? image;
  String? name;
  int? rating;
  int? courseCount;
  int? studentsCount;
  About? about;
  List<dynamic>? courses;
  Reviews? reviews;

  Organization({
    this.id,
    this.image,
    this.name,
    this.rating,
    this.courseCount,
    this.studentsCount,
    this.about,
    this.courses,
    this.reviews,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    id: json["id"],
    image: json["Image"],
    name: json["name"],
    rating: json["rating"],
    courseCount: json["course_count"],
    studentsCount: json["students_count"],
    about: json["about"] == null ? null : About.fromJson(json["about"]),
    courses: json["courses"] == null ? [] : List<dynamic>.from(json["courses"]!.map((x) => x)),
    reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Image": image,
    "name": name,
    "rating": rating,
    "course_count": courseCount,
    "students_count": studentsCount,
    "about": about?.toJson(),
    "courses": courses == null ? [] : List<dynamic>.from(courses!.map((x) => x)),
    "reviews": reviews?.toJson(),
  };
}

class About {
  String? designation;
  dynamic experiences;
  dynamic educations;

  About({
    this.designation,
    this.experiences,
    this.educations,
  });

  factory About.fromJson(Map<String, dynamic> json) => About(
    designation: json["designation"],
    experiences: json["experiences"],
    educations: json["educations"],
  );

  Map<String, dynamic> toJson() => {
    "designation": designation,
    "experiences": experiences,
    "educations": educations,
  };
}

class Reviews {
  int? reviewCount;
  int? rating;

  Reviews({
    this.reviewCount,
    this.rating,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
    reviewCount: json["review_count"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "review_count": reviewCount,
    "rating": rating,
  };
}
