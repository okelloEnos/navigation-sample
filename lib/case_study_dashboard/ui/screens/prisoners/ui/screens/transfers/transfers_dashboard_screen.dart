import 'package:flutter/material.dart';

import '../../../../../../../main.dart';
import '../../widgets/transfers_dashboard_widget.dart';

class TransfersDashboardScreen extends StatelessWidget {
  const TransfersDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,
      appBar: AppBar(
        backgroundColor: teal,
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back_ios, color: white,),
        title: const Text('Transfers', style: TextStyle(fontFamily: 'Montserrat', color: white),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0,),
          // const Center(child: Text('Offenders transfer', textAlign: TextAlign.center, style: TextStyle(color: white, fontFamily: 'Montserrat', fontSize: 30.0),)),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 20.0),
          //   child: Center(child: CircularContainer(child: Image.asset('assets/images/transfer.png', height: 100.0, color: white,))),
          // ),
          const SizedBox(height: 5.0,),
          const Expanded(child: TransfersDashboardCards()),
        ],
      ),
    );
  }
}
