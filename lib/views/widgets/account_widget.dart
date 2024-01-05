import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountWidget extends StatelessWidget {
  AccountWidget({super.key, required this.userid});
  String userid;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Color.fromARGB(255, 4, 29, 1),
          child: Text(
            'S',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          userid,
          style: TextStyle(
              color: Colors.white54, decoration: TextDecoration.underline),
        )
      ],
    );
  }
}
