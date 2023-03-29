// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/agriculture/agriculture_bloc/agriculture_info_bloc.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/agriculture/data/model/agriculture_info_model.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/offenderModel.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/data/model/prisoners_profile.dart';
// import 'package:pesa_id/case_study_dashboard/ui/screens/prisoners/prisoner_bloc/prisoners_bloc.dart';
// import 'package:pesa_id/resources/colors.dart';
// import 'package:pesa_id/resources/progress.dart';
//
// class PrisonerSearchDelegate extends SearchDelegate<PrisonerProfile?>{
//   PrisonerSearchDelegate(): super(searchFieldLabel: "search by prisoner ID", keyboardType: TextInputType.number, searchFieldStyle: const TextStyle(
//       fontFamily: 'Montserrat',
//       color: Colors.grey,
//       fontWeight: FontWeight.normal,
//       fontSize: 14.0
//   ));
//   List<PrisonerProfile> prisoners = [];
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(onPressed: () {
//         // clearing the search query amd if its empty close the search bar
//         if(query.isEmpty){
//           close(context, null);
//         }
//         else {
//           query = "";
//         }
//       }, icon: const Icon(Icons.clear))
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // leading action to close the search bar
//     return IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return const SizedBox.shrink();
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     PrisonersState state = context.read<PrisonersBloc>().state;
//
//     if(state is PrisonersSuccess){
//       prisoners = state.listOfOffenders;
//     }
//     if(prisoners.isNotEmpty){
//       prisoners = prisoners.where((prisoner){
//         final prisonerId = (prisoner.idNumber ?? "0").toString().toLowerCase();
//         final input = query.toLowerCase();
//
//         return prisonerId.contains(input);
//       }).toList();
//     }
//
//     return BlocBuilder<PrisonersBloc, PrisonersState>(
//         builder: (context, state){
//           if (state is PrisonersLoading) {
//             return Center(
//               child: spinCircle(spinColor: teal),
//             );
//           }
//           if (state is PrisonersError) {
//             return const Text('Error');
//           }
//
//           if(state is PrisonersSuccess){
//
//             return
//               prisoners.isEmpty ? const Center(
//                 child: Text('no prisoners recorded yet', textAlign: TextAlign.center, style: TextStyle(
//                     fontFamily: 'Montserrat',
//                     color: teal,
//                     fontSize: 18.0
//                 )),
//               ) :
//               ListView.builder(
//                 itemBuilder: (context, index) {
//                   final selectedPrisoner = prisoners[index];
//                   return Card(
//                     margin: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 2.0),
//                     child: ListTile(
//                       leading: const Icon(Icons.person, color: teal,),
//                       title: Text("${selectedPrisoner.name}", style: const TextStyle(
//                           fontFamily: 'Montserrat',
//                           color: teal,
//                           fontSize: 16.0
//                       ),),
//                       onTap: () {
//                         query = selectedPrisoner.idNumber.toString();
//                         close(context, selectedPrisoner);
//                       },
//                       trailing: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: const [
//                           Icon(CupertinoIcons.add_circled, color: teal,),
//                           SizedBox(width: 2.0,),
//                           Text('Add', style: TextStyle(
//                               fontFamily: 'Montserrat',
//                               color: teal,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14.0
//                           ),)
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//                 itemCount: prisoners.length,
//               );
//           }
//
//           return Center(
//             child: spinCircle(spinColor: teal),
//           );
//
//         });
//   }
//
// }
