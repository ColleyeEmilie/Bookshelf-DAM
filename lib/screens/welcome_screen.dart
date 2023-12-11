

import 'package:bookshelf/screens/register_screen.dart';
import 'package:flutter/material.dart';

import '../style/spacings.dart';
import '../widgets/main_button.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const String routeName = '/welcome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainButton(label: 'Connexion', mainColor: false, onTap: (){
                        Navigator.pushNamed(context, LoginScreen.routeName);
                        },),
                    const SizedBox(height: kVerticalPaddingS),
                    MainButton(label: 'Inscription', mainColor: false, onTap: (){
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },),
                    const SizedBox(height: kVerticalPaddingXL),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


