import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status200/controllers/accountitemcontroller.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget(
      {super.key, required this.userid, required this.accountItemController});
  String userid;
  final AccountItemController accountItemController;

  @override
  Widget build(BuildContext context) {
    accountItemController.getAccountDetails(userid);
    final username = accountItemController.username.value;
    return FutureBuilder(
      future: accountItemController.getAccountDetails(userid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final username = accountItemController.username.value;
          return Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(255, 4, 29, 1),
                  child: Text(
                    username.substring(0, 1),
                    style: TextStyle(color: Colors.green, fontSize: 17),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  username,
                  style: TextStyle(
                      color: Colors.white54,
                      decoration: TextDecoration.underline),
                )
              ],
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
