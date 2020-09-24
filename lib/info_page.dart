import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(-1, 6, 60, 248),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "We will contact you via email or instagram where we discuss payment and delivery. Await us! \n\n"
                    "You can close the app now :)",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w300),
                  ),
                )),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                exit(0);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60)),
              backgroundColor: Color.fromARGB(-1, 6, 60, 248),
              child: Text('exit'),
            )
          ],
        ),
      ),
    );
  }
}
