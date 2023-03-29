import 'package:flutter/material.dart';
import 'package:nested_navigation/case_study_dashboard/ui/widgets/case_study_dashboard_widgets.dart';

class CaseStudyDashboardScreen extends StatelessWidget {
  const CaseStudyDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white,),
        title: const Text('Case Studies', style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50.0,),
          const Center(child: Text('PesaKit Identity\nCase Studies', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 30.0),)),

          const Expanded(child: CaseStudyDashboardCards()),
        ],
      ),
    );
  }

}
