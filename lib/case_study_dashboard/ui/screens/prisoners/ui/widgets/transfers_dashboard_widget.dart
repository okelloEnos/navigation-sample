import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/communal_work_transfer_screen.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/court_transfer_screen.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/hospital_transfer_screen.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/prison_transfer_screen.dart';
import 'package:nested_navigation/main_dashboard/ui/widgets/main_dashboard_widgets.dart';

class TransfersDashboardCards extends StatelessWidget {
  const  TransfersDashboardCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
          itemCount: retrieveTransfersOptions().length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.9,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            OptionItem item = retrieveTransfersOptions()[index];

            return TransfersDashBoardOptionCard(
              item: item,
            );
          }),
    );
  }
}

class TransfersDashBoardOptionCard extends StatelessWidget {
  final OptionItem item;

  const TransfersDashBoardOptionCard({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (item.id == 2) {
          context.goNamed('court-transfer-screen');
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CourtTransferScreen()));
          // comingSoonDialogWithAnimation(context: context, title: item.name);
        }
        else if (item.id == 3) {
          context.goNamed('prison-transfer-screen');
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrisonTransferScreen()));
        }
        else if (item.id == 4) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HospitalTransferScreen()));
        }
        else if (item.id == 5) {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CommunalWorkTransferScreen()));
        }
      },
      child: Card(
        color: Colors.blue,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: Colors.white)),
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Image.asset(
            //   'assets/images/${item.imagePath}',
            //   height: 50.0,
            //   color: Colors.white,
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                item.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white, fontSize: 20.0, fontFamily: 'Montserrat'),
              ),
            )
          ],
        ),
      ),
    );
  }
}


List<OptionItem> retrieveTransfersOptions() {
  List<OptionItem> items = [];
  // OptionItem optionOne = const OptionItem(
  //     id: 1, name: "Transfer to another police station", imagePath: "police_station.png");
  OptionItem optionTwo = const OptionItem(
      id: 2, name: "Transfer to court", imagePath: "court.png");
  OptionItem optionThree = const OptionItem(
      id: 3, name: "Transfer to another prison", imagePath: "prison.png");
  OptionItem optionFour = const OptionItem(
      id: 4, name: "Transfer to hospital", imagePath: "hospital.png");
  OptionItem optionFive = const OptionItem(
      id: 5, name: "Transfer for communal work", imagePath: "community.png");


  // items.add(optionOne);
  items.add(optionTwo);
  items.add(optionThree);
  items.add(optionFour);
  items.add(optionFive);

  return items;
}