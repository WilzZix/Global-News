import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_news/components/already_have_an_account.dart';
import 'package:global_news/components/rounded_button.dart';
import 'package:global_news/components/rounded_input_field.dart';
import 'package:global_news/components/rounded_password_field.dart';
import 'package:global_news/screens/log_in/components/background.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_news/screens/sign_up/sign_up_screen.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccount(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
