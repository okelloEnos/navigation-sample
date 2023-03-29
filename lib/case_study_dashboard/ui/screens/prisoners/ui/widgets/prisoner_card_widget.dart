import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nested_navigation/case_study_dashboard/ui/screens/prisoners/data/model/prisoners_profile.dart';

class PrisonerCard extends StatelessWidget {
  final int index;
  final PrisonerProfile prisoner;
  final Function(int) onCancel;
  const PrisonerCard({Key? key, required this.index, required this.prisoner, required this.onCancel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: Container(
                      decoration: BoxDecoration(
                        // borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                        child: Center(
                            child: Text("${index + 1}.", style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'Montserrat'
                            ),)) ,
                      )),
                ),
                GestureDetector(
                  onTap: () => onCancel(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.withOpacity(0.1), shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0, right: 8.0),
                          child: Center(
                              child: Icon(
                                CupertinoIcons.multiply,
                                color: Colors.blue,
                              )),
                        )),
                  ),
                ),
              ],
            ),
            const Divider(color: Colors.white,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Prisoner ID number',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 14.0,
                        fontFamily: 'Montserrat')),
                Text('${prisoner.idNumber}',
                    style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        fontFamily: 'Montserrat')),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text('Full Name',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.normal,
                    fontSize: 14.0,
                    fontFamily: 'Montserrat')),
            const SizedBox(
              height: 0.0,
            ),
            Text('${prisoner.name}',
                style: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    fontFamily: 'Montserrat')),

          ],
        ),
      ),
    );
  }
}
