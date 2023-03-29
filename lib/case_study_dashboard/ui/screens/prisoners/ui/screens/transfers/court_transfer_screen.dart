import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/prisoners_profile.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/transfer_data.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/prisoner_bloc/prisoners_bloc.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/prisoners_main_dashboard_screen.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/transfers_dashboard_screen.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/widgets/prisoner_card_widget.dart';
import 'package:nested_navigation/main.dart';

class CourtTransferScreen extends StatefulWidget {
  const CourtTransferScreen({Key? key}) : super(key: key);

  @override
  State<CourtTransferScreen> createState() => _CourtTransferScreenState();
}

class _CourtTransferScreenState extends State<CourtTransferScreen> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController courtNameController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  // List<CourtModel> listOfCourts = [];
  List<PrisonerProfile> listOfPrisoners = [];
  String courtId = "0";
  bool courtNameMissing = false;
  List<String> listOfOffendersId = [];
  String offenderId = "0";

  @override
  void initState() {
    // context.read<CourtBloc>().add(FetchedCourtEvent());
    // context.read<PrisonersBloc>().add(PrisonersFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: teal,
      appBar: AppBar(
        backgroundColor: teal,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Court transfer', style: TextStyle(fontFamily: 'Montserrat', color: white),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: TextField(
                readOnly: true,
                controller: searchController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.white,
                onTap: () async{
                  // PrisonerProfile? selectedPrisoner = await showSearch<PrisonerProfile?>(context: context, delegate: PrisonerSearchDelegate());
                  // print(selectedPrisoner?.name);
                  // if(selectedPrisoner != null){
                  //   listOfPrisoners.add(selectedPrisoner);
                  //   searchController.text = selectedPrisoner.idNumber ?? '';
                  // }
                  //
                  // offenderId = (selectedPrisoner?.id ?? "0").toString();
                  // setState(() {});
                },
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.0,
                    fontFamily: 'Montserrat'),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.white,),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.2),
                    hintText: 'Search prisoner',
                    hintStyle: const TextStyle(
                        color: Colors.white54,
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                        fontFamily: 'Montserrat'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: teal)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: teal)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                            color: teal)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10.0)
                ),
              ),
            ),
            const SizedBox(height: 30.0,),
            const Text('Name of court',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat')),
            const SizedBox(
              height: 4.0,
            ),
            // TextField(
            //   controller: courtNameController,
            //   keyboardType: TextInputType.text,
            //   cursorColor: Colors.white,
            //   style: const TextStyle(
            //       color: Colors.white,
            //       fontWeight: FontWeight.w500,
            //       fontSize: 18.0,
            //       fontFamily: 'Montserrat'),
            //   decoration: InputDecoration(
            //     filled: true,
            //     fillColor: Colors.white.withOpacity(0.2),
            //     hintText: 'Enter court name',
            //     hintStyle: const TextStyle(
            //         color: Colors.white54,
            //         fontWeight: FontWeight.normal,
            //         fontSize: 16.0,
            //         fontFamily: 'Montserrat'),
            //     border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide: const BorderSide(
            //             color: Colors.white)),
            //     enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide: const BorderSide(
            //             color: Colors.white)),
            //     focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //         borderSide: const BorderSide(
            //             color: Colors.white)),
            //   ),
            // ),
            // BlocConsumer<CourtBloc, CourtState>(builder: (context, state){
            //   if(state is CourtSuccess){
            //     listOfCourts = state.info;
            //   }
            //   return InputDecorator(
            //     decoration: InputDecoration(
            //       suffixIconColor: Colors.white,
            //       filled: true,
            //       fillColor: Colors.white.withOpacity(0.2),
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //           borderSide: const BorderSide(
            //               color: Colors.white)),
            //       enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //           borderSide: const BorderSide(
            //               color: Colors.white)),
            //       focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(8.0),
            //           borderSide: const BorderSide(
            //               color: Colors.white)),
            //       contentPadding: const EdgeInsets.all(5),
            //     ),
            //     child: DropdownButtonHideUnderline(
            //         child: ButtonTheme(
            //             alignedDropdown: true,
            //             child: DropdownButton<String>(
            //                 value: courtId,
            //                 dropdownColor: teal,
            //                 iconDisabledColor: Colors.white54,
            //                 iconEnabledColor: Colors.white,
            //                 iconSize: 30,
            //                 icon: (null),
            //                 style: const TextStyle(
            //                     color: Colors.white,
            //                     fontSize: 16,
            //                     fontFamily: 'Montserrat'),
            //                 hint: Text(
            //                   '${AppLocalizations.of(context)?.translate('court_text_action')}', style: const TextStyle(color: Colors.white),),
            //                 items: listOfCourts.map((item) {
            //                   return DropdownMenuItem(
            //                     value: item.id.toString(),
            //                     child: item.id == 0
            //                         ? Text(
            //                       '${AppLocalizations.of(context)?.translate('court_text_action')}',
            //                       style: const TextStyle(
            //                           fontFamily: 'Montserrat',
            //                           color: Colors.white,
            //                           fontWeight: FontWeight.bold),
            //                     )
            //                         : Text(item.name,
            //                         style: const TextStyle(
            //                           fontFamily: 'Montserrat',
            //                           color: Colors.white,
            //                         )),
            //                   );
            //                 }).toList(),
            //                 onChanged: (String? newValue) {
            //                   setState(() {
            //                     courtId = newValue ?? "0";
            //                   });
            //                 }))),
            //   );
            // }, listener: (context, state){
            //   if(state is CourtFailure){
            //     Fluttertoast.showToast(msg: 'Courts not fetched');
            //   }
            // }),
            const SizedBox(
              height: 15.0,
            ),
            const Text('Transfer reason',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat')),
            const SizedBox(
              height: 4.0,
            ),
            TextField(
              minLines: 2,
              maxLines: 5,
              controller: reasonController,
              keyboardType: TextInputType.text,
              cursorColor: Colors.white,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0,
                  fontFamily: 'Montserrat'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white.withOpacity(0.2),
                hintText: 'Enter reason for transfer',
                hintStyle: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    fontFamily: 'Montserrat'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                        color: Colors.white)),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text('Prisoner${listOfPrisoners.length > 1 ? "s" : ""} List',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat')),
            const SizedBox(
              height: 10.0,
            ),

            Expanded(child:
            listOfPrisoners.isEmpty ? const Center(
              child: Text('no prisoner selected yet', textAlign: TextAlign.center, style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 18.0
              )),
            ) :
            ListView.separated(
                itemCount: listOfPrisoners.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10.0,),
                itemBuilder: (context, index){
                  PrisonerProfile prisoner = listOfPrisoners[index];
                  return PrisonerCard(index: index,  prisoner: prisoner, onCancel: (value){
                    setState(() {
                      listOfPrisoners.removeAt(index);
                    });
                  },);
                })),
            BlocConsumer<PrisonersBloc, PrisonersState>(
              builder: (context, state) {
                if (state is PrisonerTransferLoading) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0),
                    child: Column(
                      children: const [
                        LinearProgressIndicator(),
                        SizedBox(height: 4.0,),
                        Text('Transfer details submissions on progress...', textAlign: TextAlign.center , style: TextStyle(
                            fontSize: 18.0, fontFamily: 'Montserrat', color: Colors.white
                        ))
                      ],
                    ),
                  );
                } else {
                  return  GestureDetector(
                    onTap: (){
                      // court transfer details submission
                      context.read<PrisonersBloc>().add(PrisonerPrisonTransferEvent(transferData: TransferData(
                          institutionId: courtId,
                          institutionType: "court",
                          reasonForTransfer: reasonController.text,
                          offenderId: offenderId
                      )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        color: teal,
                        elevation: 4.0,
                        shadowColor: teal,
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: Text('Transfer', style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 26.0, fontWeight: FontWeight.w900),),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
              },
              listener: (context, state) {
                if (state is PrisonerTransferSuccess) {
                  submissionSuccessDialogWithAnimationWithTitle(context: context, description: "The transfer request was submitted successfully.", title: "Transfer Details Submission", onDialogPressed: () {
                    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransfersDashboardScreen()));
                    context.go('/case-studies/other-case-studies/prisoner-dashboard/transfers-dashboard');
                  });

                } else if (state is PrisonerTransferFailure) {
                  // submissionFailureDialogWithAnimationWithTitle(context: context, description: state.errorText, title: "Transfer Details Submission");
                }
              },),
            const SizedBox(height: 10.0,),
          ],
        ),
      ),
    );
  }
}
