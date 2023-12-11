import 'package:bookshelf/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  late bool _userCreated = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text("Se déconnecter"),
        onPressed: () async{
          await FirebaseAuth.instance.signOut();
          setState((){
            _userCreated = false;
          });

          Navigator.pushNamed(context, WelcomeScreen.routeName);
        }
    );
  }
}
