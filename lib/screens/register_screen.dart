
import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../style/spacings.dart';
import '../widgets/form/text_input.dart';
import '../widgets/main_button.dart';
import 'home_screen.dart';

//test2@hotmail.com
//Kaitsiyah
//change_this1

//Astherya
// colleyeemilie@hotmail.com
// change_this

class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  String _email = '';
   String _password= '';
  String _username ='';
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  RegisterScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override

  Future<void> addUser() async {
    return await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set({
      'email': _email,
      //'uid': FirebaseAuth.instance.currentUser?.uid,
      'username': _username,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: kVerticalPaddingXL),
                          TextInput(prefixIcon: Icons.email, hintText: "exemple@mail.com", labelText: "Entrez votre email", validator: (value)
                          {
                            _email = value!;
                            if (value.isEmpty) {
                              return 'La valeur ne peut pas être nulle';
                            } else {
                              return null;
                            }
                          },),
                          const SizedBox(height: kVerticalPaddingS),
                          TextInput(prefixIcon: Icons.password, hintText: "*********", labelText: "Mot de passe", validator: (value){
                            _password = value!;
                            if (value == null || value.isEmpty) {
                              return 'La valeur ne peut pas être nulle';
                            } else {
                              return null;
                            }
                          }),
                          const SizedBox(height: kVerticalPaddingS),
                          TextInput(prefixIcon: Icons.person, hintText: "Nom d'utilisateur", labelText: "Nom d'utilisateur ", validator: (value){
                            _username = value!;
                            if (value.isEmpty) {
                              return "Vous devez choisir un nom d'utilisateur !";
                            } else {
                              return null;
                            }
                          }),
                          const SizedBox(height: kVerticalPaddingS),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MainButton(label: "Créer mon compte", mainColor: false, onTap: () async {
                                if(_formKey.currentState!.validate()){
                                  try{
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(email:_email, password: _password)
                                        .then((value)=>
                                    {
                                      addUser(),
                                      Navigator.pushNamed(context, HomeScreen.routeName)
                                    });
                                  } on FirebaseAuthException catch (e){
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      duration: const Duration(seconds: 10),
                                      content:Text(e.message ?? 'Erreur inconnue'),
                                    ));
                                  }
                                }
                              }),
                            ],
                          ),
                          const SizedBox(height: kVerticalPaddingXL),
                          ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
