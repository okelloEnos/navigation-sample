import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/case_study_dashboard_screen.dart';


class MainDashboardCards extends StatelessWidget {
  const MainDashboardCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: GridView.builder(
          itemCount: retrieveMainOptions().length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0),
          itemBuilder: (context, index) {
            OptionItem item = retrieveMainOptions()[index];

            return MainDashBoardOptionCard(
              item: item,
            );
          }),
    );
  }
}

class MainDashBoardOptionCard extends StatelessWidget {
  final OptionItem item;

  const MainDashBoardOptionCard({Key? key, required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //     builder: (context) => const CaseStudyDashboardScreen()));
        context.goNamed('case-studies');
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
              "${item.name}",
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

List<OptionItem> retrieveMainOptions() {

  List<OptionItem> items = [];

  OptionItem optionThree = const OptionItem(
      id: 3, name: "case_studies_text", imagePath: "case_study.png");



  items.add(optionThree);


  return items;
}

class OptionItem {
  final int id;
  final String name;
  final String imagePath;

  const OptionItem(
      {required this.id, required this.name, required this.imagePath});
}