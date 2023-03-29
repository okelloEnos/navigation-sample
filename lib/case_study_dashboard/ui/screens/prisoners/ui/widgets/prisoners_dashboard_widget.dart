import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/transfers/transfers_dashboard_screen.dart';
import 'package:nested_navigation/main_dashboard/ui/widgets/main_dashboard_widgets.dart';

class PrisonerMainDashboardCards extends StatelessWidget {
  const PrisonerMainDashboardCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
          itemCount: retrievePrisonersMainOptions().length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.1,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            OptionItem item = retrievePrisonersMainOptions()[index];

            return PrisonerDashBoardOptionCard(
              item: item,
            );
          }),
    );
  }
}

class PrisonerDashBoardOptionCard extends StatelessWidget {
  final OptionItem item;

  const PrisonerDashBoardOptionCard({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TransfersDashboardScreen()));
context.goNamed('transfers-dashboard');
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
            Text(
              item.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20.0, fontFamily: 'Montserrat'),
            )
          ],
        ),
      ),
    );
  }
}


List<OptionItem> retrievePrisonersMainOptions() {
  List<OptionItem> items = [];
  OptionItem optionOne = const OptionItem(
      id: 1, name: "Offenders Enrollment", imagePath: "book_offender.png");
  OptionItem optionTwo = const OptionItem(
      id: 2, name: "Record a Statement", imagePath: "write_statement.png");
  OptionItem optionThree = const OptionItem(
      id: 3, name: "Offenders Records", imagePath: "offender_records.png");
  OptionItem optionFour = const OptionItem(
      id: 4, name: "Statements List", imagePath: "statements_list.png");
  OptionItem optionFive = const OptionItem(
      id: 5, name: "Transfers", imagePath: "transfer.png");
  OptionItem optionSix = const OptionItem(
      id: 6, name: "Releases", imagePath: "release.png");

  items.add(optionOne);
  items.add(optionTwo);
  items.add(optionThree);
  items.add(optionFour);
  items.add(optionFive);
  items.add(optionSix);

  return items;
}