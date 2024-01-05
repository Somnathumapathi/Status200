import 'package:flutter/material.dart';

class AccountWidget extends StatelessWidget {
  const AccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 15,
          child: Text(
            'S',
            style: TextStyle(color: Colors.green, fontSize: 17),
          ),
          backgroundColor: Color.fromARGB(255, 4, 29, 1),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          'Username',
          style: TextStyle(
              color: Colors.white54, decoration: TextDecoration.underline),
        )
      ],
    );
  }
}
