// import 'dart:io';
//
// import 'package:dio/dio.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/arrest_data.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/offenderModel.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/prisoner_data_collection.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/release_data.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/transfer_data.dart';
// import 'package:pesa_id/main.dart';
// import 'package:pesa_id/resources/constants.dart';
//
// import '../../../../../../resources/util.dart';
//
// class PrisonerDataProvider{
//
//   /// return a list of offenders
//   Future<List<OffenderModel>> retrieveListOfOffenders() async{
//     // Simulating network latency
//     await Future.delayed(const Duration(seconds: 1));
//     List<OffenderModel> listOfOffenders = [const OffenderModel(fullName: 'Okello Enos', idNumber: '35273283', offenderId: '70733'),
//       const OffenderModel(fullName: 'Nochiaso Opiya', idNumber: '45673283', offenderId: '12783'), const OffenderModel(fullName: 'Jake Peralta', idNumber: '904231', offenderId: '063413'),
//       const OffenderModel(fullName: 'Amy Santiago', idNumber: '890623', offenderId: '89042')];
//     return listOfOffenders;
//   }
//
//   /// enrolling prisoner request
//   Future<dynamic> enrollingOffenderRequest({required PrisonerInfo prisoner}) async{
//     const url = "/api/prison/offenders/enroll";
//     String? token = preferences.getString(validToken);
//
//     BaseOptions options = BaseOptions(
//         baseUrl: identityBaseUrl,
//         receiveDataWhenStatusError: true,
//         contentType: 'application/json',
//         headers: {"authorization": "Bearer $token"});
//     Dio dio = Dio(options);
//     File selfieImage = await compressFile(prisoner.selfieCapture!);
//     File frontSideImage = await compressFile(prisoner.frontId!);
//     File backSideImage = await compressFile(prisoner.backId!);
//
//     String? selfieImageString = selfieImage.path.split('/').last;
//     String? frontIdImageString = frontSideImage.path.split('/').last;
//     String? backIdImageString = backSideImage.path.split('/').last;
//
//     FormData formData = FormData.fromMap({
//       "name": prisoner.fullName,
//       "id_number": prisoner.idNumber,
//       "phone_number": prisoner.phone,
//       "date_of_birth": prisoner.dateOfBirth,
//       "place_of_birth": prisoner.placeOfBirth,
//       "place_of_residence": prisoner.placeOfResidence,
//       "next_of_kin_name": prisoner.kinName,
//       "next_of_kin_phone_number": prisoner.kinPhone,
//       "next_of_kin_relationship": prisoner.relationship,
//       "face_photo": await MultipartFile.fromFile(selfieImage.path,
//           filename: selfieImageString),
//       "front_id": await MultipartFile.fromFile(frontSideImage.path,
//           filename: frontIdImageString),
//       "back_id": await MultipartFile.fromFile(backSideImage.path,
//           filename: backIdImageString)
//     });
//
//     Response response = await dio.post(url, data: formData);
//     if(response.data["status"] == 2){
//       return response.data["details"];
//     }
//     else{
//       throw (response.data["message"]);
//     }
//   }
//
//   /// add arrest request
//   Future<dynamic> addArrestRequest({required ArrestInfo info}) async{
//     const url = "/api/prison/arrests/add";
//     String? token = preferences.getString(validToken);
//     BaseOptions options = BaseOptions(
//         baseUrl: identityBaseUrl,
//         receiveDataWhenStatusError: true,
//         contentType: 'application/json',
//         headers: {"authorization": "Bearer $token"});
//
//     Dio dio = Dio(options);
//
//     var arrestData = {
//       "offender_id": info.offenderId,
//       "committal_warrant": info.arrestWarrant,
//       "place_of_arrest": info.arrestLocation,
//       "date_of_arrest": info.arrestDate,
//       "crime": info.arrestCrime,
//       "prison_id": info.prisonId,
//     };
//
//     Response response = await dio.post(url, data: arrestData);
//
//     if(response.data["status"] == 2){
//       return response.data["status"];
//     }
//     else{
//       throw (response.data["message"]);
//     }
//   }
//
//   /// retrieve list of prisoners
//   Future<dynamic> retrieveAllPrisonersRequest() async{
//     const url = "/api/prison/offenders/all";
//     String? token = preferences.getString(validToken);
//     BaseOptions options = BaseOptions(
//         baseUrl: identityBaseUrl,
//         receiveDataWhenStatusError: true,
//         contentType: 'application/json',
//         headers: {"authorization": "Bearer $token"});
//
//     Dio dio = Dio(options);
//
//     Response response = await dio.get(url);
//
//     if(response.data["status"] == 2){
//       return response.data["details"];
//     }
//     else{
//       throw (response.data["message"]);
//     }
//   }
//
//   /// transfer request
//   Future<dynamic> transferRequest({required TransferData info}) async{
//     const url = "/api/prison/transfers/add";
//     String? token = preferences.getString(validToken);
//     BaseOptions options = BaseOptions(
//         baseUrl: identityBaseUrl,
//         receiveDataWhenStatusError: true,
//         contentType: 'application/json',
//         headers: {"authorization": "Bearer $token"});
//
//     Dio dio = Dio(options);
//
//     var transferData = {
//       "offender_id": info.offenderId,
//       "type": info.institutionType,
//       "institution_id": info.institutionId,
//       "reason": info.reasonForTransfer
//     };
//
//     Response response = await dio.post(url, data: transferData);
//
//     if(response.data["status"] == 1){
//       return response.data["status"];
//     }
//     else{
//       throw (response.data["message"]);
//     }
//   }
//
//   /// release request
//   Future<dynamic> releaseRequest({required ReleaseData info}) async{
//     const url = "/api/prison/releases/add";
//     String? token = preferences.getString(validToken);
//     BaseOptions options = BaseOptions(
//         baseUrl: identityBaseUrl,
//         receiveDataWhenStatusError: true,
//         contentType: 'application/json',
//         headers: {"authorization": "Bearer $token"});
//
//     Dio dio = Dio(options);
//
//     var releaseData = {
//       "offender_id": info.offenderId,
//       "type": info.institutionType,
//       "institution_id": info.institutionId,
//       "reason": info.reasonForTransfer
//     };
//
//     Response response = await dio.post(url, data: releaseData);
//
//     if(response.data["status"] == 2){
//       return response.data["status"];
//     }
//     else{
//       throw (response.data["message"]);
//     }
//   }
// }