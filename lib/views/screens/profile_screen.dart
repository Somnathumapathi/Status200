import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/views/screens/myquestions_screen.dart';

import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  final String userName;
  final Color backgroundColor;
  final Color textColor;

  const ProfileScreen(
      {this.userName = "name",
      this.backgroundColor = Colors.white,
      this.textColor = Colors.black,
      super.key});

  String get firstLetter => this.userName.substring(0, 1).toUpperCase();

  @override
  Widget build(BuildContext context) {
    //String firstLetter = userName.isNotEmpty ? userName[0].toUpperCase() : '';
    return Scaffold(
      //backgroundColor: const Color.fromARGB(61, 0, 0, 0),
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(
              left: 20.0, top: 5.0, right: 20.0, bottom: 10.0),
          child: Column(
            children: [
              Row(children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 30.0),
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Color.fromARGB(129, 0, 0, 0),
                    child: Text('N',
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 56, 12),
                            fontSize: 60.0)),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 30),
                  Text(
                    'Username',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Email',
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 10),
                  TextButton.icon(
                    onPressed: () => authController.logout(),
                    label: Text('Logout'),
                    icon: Icon(Icons.logout),
                  ),
                  SizedBox(height: 30),
                ])
              ]),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'MY QUESTIONS',
                  style: TextStyle(fontSize: 25),
                  // textAlign: ,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListView(
                    itemExtent: 80.0,
                    children: const <Widget>[
                      ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python."'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 10, 56, 12),
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 18)),
                      onPressed: () {
                        Get.to(MyQuestionsScreen());
                      },
                      child: const Text('Show more'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
