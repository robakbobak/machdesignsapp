import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'info_page.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

String email;
String size;
String ig;

String username = "machdesigns.sk@gmail.com";
String password = "roboamato";

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(-1, 6, 60, 248),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 50.0, 8.0, 8.0),
        child: Center(
          child: Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Image.asset(
                      'assets/mach2.jpg',
                      height: 350,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 5.0),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.emailAddress,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              cursorWidth: 1,
                              onChanged: (text) {
                                text = text.toString();
                                email = text;
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter an email',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              cursorWidth: 1,
                              onChanged: (text) {
                                text = text.toString();
                                size = text;
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: Colors.black),
                                hintText: 'Enter a size',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                            child: TextField(
                              style: TextStyle(color: Colors.white),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              cursorWidth: 1,
                              onChanged: (text) {
                                text = text.toString();
                                ig = text;
                              },
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40)),
                                hintStyle: TextStyle(color: Colors.black),
                                prefixIcon: Icon(Icons.alternate_email),
                                hintText: 'Enter an instagram acc',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: -1,
                    child: OutlineButton(
                      onPressed: () async {
                        final smtpServer = gmail(username, password);
                        final message = Message()
                          ..from = Address(username)
                          ..recipients
                              .add('machdesigns.sk@gmail.com') //recipent email

                          ..subject =
                              'order drom $ig ${DateTime.now()}' //subject of the email
                          ..text =
                              'ig = $ig, size = $size, email = $email'; //body of the email
                        try {
                          final sendReport = await send(message, smtpServer);
                          print('Message sent: ' +
                              sendReport
                                  .toString()); //print if the email is sent
                        } on MailerException catch (e) {
                          print('Message not sent. \n' +
                              e.toString()); //print if the email is not sent
                          // e.toString() will show why the email is not sending
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoPage()),
                        );
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      borderSide: BorderSide(color: Colors.blue),
                      shape: StadiumBorder(),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
