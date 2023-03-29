import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/screens/prisoners_main_dashboard_screen.dart';
import 'package:nested_navigation/main_dashboard/ui/widgets/main_dashboard_widgets.dart';

class OtherCasesDashboardCards extends StatelessWidget {
  const OtherCasesDashboardCards({Key? key}) : super(key: key);

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
context.goNamed('prisoner-dashboard');
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PrisonersMainDashboardScreen()));

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
            //   color: Colors.white
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
  OptionItem optionOne = const OptionItem(
      id: 1, name: "Medical Insurance", imagePath: "medical_insurance.png");
  OptionItem optionTwo = const OptionItem(
      id: 2, name: "Student Enrollment", imagePath: "student_enrol.png");
  OptionItem optionThree = const OptionItem(
      id: 3, name: "Prisoners Enrollment", imagePath: "prison_enrol.png");
  OptionItem optionFour = const OptionItem(
      id: 4, name: "Cross Border Tracking", imagePath: "border_tracking.png");
  OptionItem optionFive =
      const OptionItem(id: 1, name: "Sales Visit", imagePath: "sale_visit.png");
  OptionItem optionSix = const OptionItem(
      id: 2, name: "Public Safety", imagePath: "public_service.png");
  OptionItem optionSeven = const OptionItem(
      id: 4, name: "Pandemic Tracking", imagePath: "pandemic.png");

  items.add(optionOne);
  items.add(optionTwo);
  items.add(optionThree);
  items.add(optionFour);
  items.add(optionFive);
  items.add(optionSix);
  items.add(optionSeven);
  return items;
}
