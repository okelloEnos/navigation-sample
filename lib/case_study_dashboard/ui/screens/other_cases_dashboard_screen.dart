import 'package:flutter/material.dart';
import 'package:nested_navigation/case_study_dashboard/ui/widgets/other_cases/other_case_dashboard_widgets.dart';

class OtherCasesDashboardScreen extends StatelessWidget {
  const OtherCasesDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,
        leading: Icon(Icons.arrow_back, color: Colors.white,),
        title: const Text('More Case Studies', style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50.0,),
          const Center(child: Text('PesaKit Identity\nMore Use Cases', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontFamily: 'Montserrat', fontSize: 30.0),)),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20.0),
          //   child: Center(child: Image.asset('assets/images/more.png', height: 100.0, color: Colors.white,)),
          // ),
          const Expanded(child: OtherCasesDashboardCards()),
        ],
      ),
    );
  }

}