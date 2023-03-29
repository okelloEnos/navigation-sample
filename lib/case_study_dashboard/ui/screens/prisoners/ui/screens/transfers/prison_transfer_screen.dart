import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../main.dart';
import '../../../data/model/prisoners_profile.dart';
import '../../../data/model/transfer_data.dart';
import '../../../prisoner_bloc/prisoners_bloc.dart';
import '../../widgets/prisoner_card_widget.dart';

class PrisonTransferScreen extends StatefulWidget {
  const PrisonTransferScreen({Key? key}) : super(key: key);

  @override
  State<PrisonTransferScreen> createState() => _PrisonTransferScreenState();
}

class _PrisonTransferScreenState extends State<PrisonTransferScreen> {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();
  // List<PrisonModel> listOfPrisons = [];
  List<PrisonerProfile> listOfPrisoners = [];
  String prisonId = "0";
  bool prisonNameMissing = false;
  List<String> listOfOffendersId = [];
  String offenderId = "0";

  @override
  void initState() {
    // context.read<PrisonBloc>().add(FetchedPrisonEvent());
    // context.read<PrisonersBloc>().add(PrisonersFetched());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: teal,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios, color: white,),
        title: const Text('Prison transfer', style: TextStyle(fontFamily: 'Montserrat', color: white),),
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
                // onTap: () async{
                //   PrisonerProfile? selectedPrisoner = await showSearch<PrisonerProfile?>(context: context, delegate: PrisonerSearchDelegate());
                //   print(selectedPrisoner?.name);
                //  if(selectedPrisoner != null){
                //    listOfPrisoners.add(selectedPrisoner);
                //    searchController.text = selectedPrisoner.idNumber ?? '';
                //  }
                //
                //   offenderId = (selectedPrisoner?.id ?? "0").toString();
                //  setState(() {});
                // },
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
            const Text('Prison Name',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat')),
            const SizedBox(
              height: 4.0,
            ),
            // BlocConsumer<PrisonBloc, PrisonState>(builder: (context, state){
            //   if(state is PrisonSuccess){
            //     listOfPrisons = state.info;
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
            //                 value: prisonId,
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
            //                   '${AppLocalizations.of(context)?.translate('prison_text_action')}', style: const TextStyle(color: Colors.white),),
            //                 items: listOfPrisons.map((item) {
            //                   return DropdownMenuItem(
            //                     value: item.id.toString(),
            //                     child: item.id == 0
            //                         ? Text(
            //                       '${AppLocalizations.of(context)?.translate('prison_text_action')}',
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
            //                     prisonId = newValue ?? "0";
            //                   });
            //                 }))),
            //   );
            // }, listener: (context, state){
            //   if(state is PrisonFailure){
            //     Fluttertoast.showToast(msg: 'Prisons not fetched');
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
                      // prisoner transfer details submission
                      context.read<PrisonersBloc>().add(PrisonerPrisonTransferEvent(transferData: TransferData(
                        institutionId: prisonId,
                        institutionType: "prison",
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
                    Navigator.pop(context);
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
