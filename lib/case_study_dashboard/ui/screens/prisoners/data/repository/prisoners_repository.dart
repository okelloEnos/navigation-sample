// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/data_provider/prisoners_data_provider.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/arrest_data.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/offenderModel.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/prisoner_data_collection.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/prisoners_profile.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/release_data.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/transfer_data.dart';
//
// class PrisonersRepository{
//   final PrisonerDataProvider dataProvider = PrisonerDataProvider();
//
//   /// fetch list of offenders
// Future<List<OffenderModel>> listOfOffenderRequest() async{
//   return await dataProvider.retrieveListOfOffenders();
// }
//
//   /// fetch list of offenders
//   Future<int> prisonerEnrollRequest({required PrisonerInfo info}) async{
//   int enrollResponse = 0;
//   var response = await dataProvider.enrollingOffenderRequest(prisoner: info);
//   enrollResponse = response['id'];
//     return enrollResponse;
//   }
//
//   /// add arrest info
//   Future<int> arrestRequest({required ArrestInfo info}) async{
//     return await dataProvider.addArrestRequest(info: info);
//   }
//
//   /// retrieve list of offenders
//   Future<List<PrisonerProfile>> retrievePrisonersList() async {
//     final data = await dataProvider.retrieveAllPrisonersRequest();
//     List<PrisonerProfile> offenders = [];
//     offenders = List<PrisonerProfile>.from(
//         data.map((info) => PrisonerProfile.fromJson(info)));
//     return offenders;
//   }
//
//   /// transfer info
//   Future<int> submitTransferRequest({required TransferData info}) async{
//     return await dataProvider.transferRequest(info: info);
//   }
//
//   /// release info
//   Future<int> submitReleaseRequest({required ReleaseData info}) async{
//     return await dataProvider.releaseRequest(info: info);
//   }
// }