// ignore: unused_import
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
                const Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 40.0),
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
                  const SizedBox(height: 20.0),
                  const Padding(
                    padding: EdgeInsets.only(left:13.0, right:5.0, top:5.0, bottom:5.0),
                    child: Text(
                      'Username',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  //const SizedBox(height: 10.0),
                  const Padding(
                    padding: EdgeInsets.only(left:13.0, right:5.0, top:5.0, bottom:5.0),
                    child: Text(
                      'Email',
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                  // const SizedBox(height: 10.0),
                  TextButton.icon(
                      onPressed: () => authController.logout(),
                      label: const Text('Logout', style: TextStyle(color: Color.fromARGB(255, 34, 113, 40), fontSize: 20.0),),
                      icon: const Icon(Icons.logout, color:Color.fromARGB(255, 34, 113, 40), size: 25.0,),
                      ),
                  const SizedBox(height: 10.0),
                ])
              ]),
              const SizedBox(height: 20.0),
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'MY QUESTIONS',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const SizedBox(height: 15.0),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: ListView(
                    itemExtent: 70.0,
                    children: ListTile.divideTiles(context: context, tiles: [
                      const ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      const ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python."'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      const ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                      const ListTile(
                        title: Text(
                            'State True or False “Variable declaration is implicit in Python.”'),
                        tileColor: Color.fromARGB(130, 1, 0, 0),
                      ),
                    ]).toList(),
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
