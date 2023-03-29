import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/other_cases_dashboard_screen.dart';
import 'package:nested_navigation/main_dashboard/ui/widgets/main_dashboard_widgets.dart';

class CaseStudyDashboardCards extends StatelessWidget {
  const CaseStudyDashboardCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
          itemCount: retrieveCaseStudyOptions().length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            OptionItem item = retrieveCaseStudyOptions()[index];

            return CaseStudyDashBoardOptionCard(
              item: item,
            );
          }),
    );
  }
}

class CaseStudyDashBoardOptionCard extends StatelessWidget {
  final OptionItem item;

  const CaseStudyDashBoardOptionCard({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const OtherCasesDashboardScreen()));
context.goNamed('other-case-studies');
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

List<OptionItem> retrieveCaseStudyOptions() {
  List<OptionItem> items = [];
  OptionItem optionOne =
      const OptionItem(id: 1, name: "SIM Card", imagePath: "sim_card.png");
  OptionItem optionTwo = const OptionItem(
      id: 2, name: "Security Check", imagePath: "security.png");
  OptionItem optionThree = const OptionItem(
      id: 3, name: "Refugee Management", imagePath: "refugee.png");
  OptionItem optionFour =
      const OptionItem(id: 4, name: "Education", imagePath: "education.png");
  OptionItem optionFive =
  const OptionItem(id: 5, name: "Agriculture", imagePath: "agriculture.png");
  OptionItem optionSix =
  const OptionItem(id: 6, name: "Other Cases", imagePath: "more.png");
  items.add(optionOne);
  items.add(optionTwo);
  items.add(optionThree);
  items.add(optionFour);
  items.add(optionFive);
  items.add(optionSix);
  return items;
}
