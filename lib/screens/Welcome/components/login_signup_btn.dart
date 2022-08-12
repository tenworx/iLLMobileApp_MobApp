import 'package:flutter/material.dart';
import 'package:outlook/responsive.dart';
import '/screens/auth/login.dart';
import '/screens/auth/signup.dart';

import '../../../constants.dart';

class LoginAndSignupBtn extends StatelessWidget {
  const LoginAndSignupBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: "login_btn",
          child: Container(
            height: 70,
            width: 250,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  elevation: null,
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Login(
                        role: 'user',
                      );
                    },
                  ),
                );
              },
              child: Text(
                "Schedule Appointment".toUpperCase(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 70,
          width: 250,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUp(role: 'user');
                  },
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(kBgLightColor),
                elevation: null,
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)))),
            child: Text(
              "Create Account".toUpperCase(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        Container(
          // margin: EdgeInsets.only(
          //   left: Responsive.isMobile(context)
          //       ? 0
          //       : MediaQuery.of(context).size.width * 0.1,
          // ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Admin?'),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Login(role: 'admin');
                      },
                    ),
                  );
                },
                child: Text(
                  ' Click here to login',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
