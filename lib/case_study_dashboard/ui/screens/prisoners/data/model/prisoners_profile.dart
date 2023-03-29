// To parse this JSON data, do
//
//     final prisonerProfile = prisonerProfileFromJson(jsonString);

import 'dart:convert';

PrisonerProfile prisonerProfileFromJson(String str) => PrisonerProfile.fromJson(json.decode(str));

String prisonerProfileToJson(PrisonerProfile data) => json.encode(data.toJson());

class PrisonerProfile {
  PrisonerProfile({
    this.id,
    this.name,
    this.idNumber,
    this.phone,
    this.dateOfBirth,
    this.placeOfBirth,
    this.placeOfResidence,
    this.selfieCapture,
    this.frontId,
    this.backId,
    this.nextOfKinInformation,
  });

  final int? id;
  final String? name;
  final String? idNumber;
  final String? phone;
  final DateTime? dateOfBirth;
  final String? placeOfBirth;
  final String? placeOfResidence;
  final String? selfieCapture;
  final String? frontId;
  final String? backId;
  final List<NextOfKinInformation>? nextOfKinInformation;

  PrisonerProfile copyWith({
    int? id,
    String? name,
    String? idNumber,
    String? phone,
    DateTime? dateOfBirth,
    String? placeOfBirth,
    String? placeOfResidence,
    String? selfieCapture,
    String? frontId,
    String? backId,
    List<NextOfKinInformation>? nextOfKinInformation,
  }) =>
      PrisonerProfile(
        id: id ?? this.id,
        name: name ?? this.name,
        idNumber: idNumber ?? this.idNumber,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        placeOfResidence: placeOfResidence ?? this.placeOfResidence,
        selfieCapture: selfieCapture ?? this.selfieCapture,
        frontId: frontId ?? this.frontId,
        backId: backId ?? this.backId,
        nextOfKinInformation: nextOfKinInformation ?? this.nextOfKinInformation,
      );

  factory PrisonerProfile.fromJson(Map<String, dynamic> json) => PrisonerProfile(
    id: json["id"],
    name: json["name"],
    idNumber: json["id_number"],
    phone: json["phone"],
    dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
    placeOfBirth: json["place_of_birth"],
    placeOfResidence: json["place_of_residence"],
    selfieCapture: json["selfie_capture"],
    frontId: json["front_id"],
    backId: json["back_id"],
    nextOfKinInformation: json["next_of_kin_information"] == null ? [] : List<NextOfKinInformation>.from(json["next_of_kin_information"]!.map((x) => NextOfKinInformation.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "id_number": idNumber,
    "phone": phone,
    "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
    "place_of_birth": placeOfBirth,
    "place_of_residence": placeOfResidence,
    "selfie_capture": selfieCapture,
    "front_id": frontId,
    "back_id": backId,
    "next_of_kin_information": nextOfKinInformation == null ? [] : List<dynamic>.from(nextOfKinInformation!.map((x) => x.toJson())),
  };
}

class NextOfKinInformation {
  NextOfKinInformation({
    this.id,
    this.name,
    this.phone,
    this.relationship,
  });

  final int? id;
  final String? name;
  final String? phone;
  final String? relationship;

  NextOfKinInformation copyWith({
    int? id,
    String? name,
    String? phone,
    String? relationship,
  }) =>
      NextOfKinInformation(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        relationship: relationship ?? this.relationship,
      );

  factory NextOfKinInformation.fromJson(Map<String, dynamic> json) => NextOfKinInformation(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    relationship: json["relationship"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "relationship": relationship,
  };
}
