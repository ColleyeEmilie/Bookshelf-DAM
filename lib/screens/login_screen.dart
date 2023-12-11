
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../style/spacings.dart';
import '../widgets/form/text_input.dart';
import '../widgets/main_button.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final String  _email = 'colleyeemilie@hotmail.com';
  final String _password= 'change_this';
  final _formKey = GlobalKey<FormState>();
  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: kVerticalPaddingXL),
                        TextInput(
                          prefixIcon: Icons.email,
                          hintText: "exemple@mail.com",
                          labelText: "Entrez votre email",
                          validator: (value) {
                            value = _email;
                            if (value.isEmpty) {
                              return 'La valeur ne peut pas être nulle';
                            } else {
                              return null;
                            }
                          },
                        ),
                        const SizedBox(height: kVerticalPaddingL),
                        TextInput(
                            prefixIcon: Icons.password,
                            hintText: "*********",
                            labelText: "Mot de passe",
                            validator: (value) {
                              value = _password;
                              if (value.isEmpty) {
                                return 'La valeur ne peut pas être nulle';
                              } else {
                                return null;
                              }
                            }),
                        MainButton(
                            label: "Je me connecte",
                            mainColor: false,
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                                        email: _email,
                                        password: _password
                                    ).then((value) => {
                                      debugPrint('valide'),
                                      Navigator.pushNamed(context, HomeScreen.routeName),
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'user-not-found') {
                                      debugPrint('No user found for that email.');
                                    } else if (e.code == 'wrong-password') {
                                      debugPrint('Wrong password provided for that user.');
                                    }
                                  }
                              }
                            }),
                        const SizedBox(height: kVerticalPaddingXL),
                        const Text('Je n ai pas encore de compte'),
                        GestureDetector(
                          child: const Text('Créer mon compte !'),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
