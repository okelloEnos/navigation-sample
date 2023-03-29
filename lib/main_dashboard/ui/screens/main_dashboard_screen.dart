import 'package:flutter/material.dart';
import 'package:nested_navigation/main.dart';
import 'package:nested_navigation/main_dashboard/ui/widgets/main_dashboard_widgets.dart';

class MainDashboardScreen extends StatelessWidget {
  const MainDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0, centerTitle: true,
        backgroundColor: Colors.blue,
        leading: const Icon(
          Icons.menu_outlined,
          color: Colors.white,
        ),
        title: Text(
          "pesakit_identity_text",
          style: const TextStyle(fontFamily: 'Montserrat', color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Center(
              child: Text(
                "welcome_text_two",
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontFamily: 'Montserrat', fontSize: 30.0),
          )),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20.0),
          //   child: Center(
          //       child: Image.asset(
          //     'assets/images/avatar.png',
          //     height: 100.0,
          //   )),
          // ),
          const Expanded(child: MainDashboardCards()),
        ],
      ),
    );
  }
}
