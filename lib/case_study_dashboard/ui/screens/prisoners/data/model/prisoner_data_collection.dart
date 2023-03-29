import 'dart:io';

class PrisonerInfo {
  PrisonerInfo({
    this.fullName,
    this.idNumber,
    this.phone,
    this.dateOfBirth,
    this.placeOfBirth,
    this.placeOfResidence,
    this.selfieCapture,
    this.frontId,
    this.backId,
    this.kinName,
    this.kinPhone,
    this.relationship,
  });

  final String? fullName;
  final String? idNumber;
  final String? phone;
  final String? dateOfBirth;
  final String? placeOfBirth;
  final String? placeOfResidence;
  final File? selfieCapture;
  final File? frontId;
  final File? backId;
  final String? kinName;
  final String? kinPhone;
  final String? relationship;

  PrisonerInfo copyWith({
    String? fullName,
    String? idNumber,
    String? phone,
    String? dateOfBirth,
    String? placeOfBirth,
    String? placeOfResidence,
    File? selfieCapture,
    File? frontId,
    File? backId,
    String? kinName,
    String? kinPhone,
    String? relationship,
  }) =>
      PrisonerInfo(
        fullName: fullName ?? this.fullName,
        idNumber: idNumber ?? this.idNumber,
        phone: phone ?? this.phone,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        placeOfResidence: placeOfResidence ?? this.placeOfResidence,
        selfieCapture: selfieCapture ?? this.selfieCapture,
        frontId: frontId ?? this.frontId,
        backId: backId ?? this.backId,
        kinName: kinName ?? this.kinName,
        kinPhone: kinPhone ?? this.kinPhone,
        relationship: relationship ?? this.relationship,
      );
}

