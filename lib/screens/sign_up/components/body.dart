import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:global_news/components/already_have_an_account.dart';
import 'package:global_news/components/rounded_button.dart';
import 'package:global_news/components/rounded_input_field.dart';
import 'package:global_news/components/rounded_password_field.dart';
import 'package:global_news/screens/log_in/login_screen.dart';
import 'package:global_news/screens/sign_up/components/background.dart';
import 'package:global_news/screens/sign_up/components/or_devider.dart';
import 'package:global_news/screens/sign_up/components/social_icon.dart';

class Body extends StatelessWidget {
  final Widget child;

  const Body({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: 'Your email',
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              press: () {},
              text: "SIGN UP",
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccount(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      {
                        return LoginScreen();
                      }
                    },
                  ),
                );
              },
            ),
            OrDevider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialMedia(
                  iconSrc: 'assets/icons/facebook.svg',
                  press: () {},
                ),
                SocialMedia(
                  iconSrc: 'assets/icons/google-plus.svg',
                  press: () {},
                ),
                SocialMedia(
                  iconSrc: 'assets/icons/twitter.svg',
                  press: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
