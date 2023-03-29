import 'package:flutter/material.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/ui/widgets/prisoners_dashboard_widget.dart';

class PrisonersMainDashboardScreen extends StatelessWidget {
  const PrisonersMainDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white,),
        title: const Text('Prisoners Enrollment', style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30.0,),
          const Center(child: Text('Central offenders\nonboarding', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 30.0),)),
          const SizedBox(height: 20.0,),
          const Expanded(child: PrisonerMainDashboardCards()),
        ],
      ),
    );
  }
}
