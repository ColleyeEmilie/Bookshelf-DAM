import 'package:bookshelf/widgets/background.dart';
import 'package:bookshelf/widgets/form/text_input.dart';
import 'package:bookshelf/widgets/main_button.dart';
import 'package:bookshelf/widgets/listes/get_lists.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../widgets/navigation/bottom_navigation.dart';

class NewListScreen extends StatelessWidget {
  NewListScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const String routeName = '/NewList';
  String _listTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer une nouvelle liste',
            style: TextStyle(color: kSecondaryColor)),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
      ),
      body: Stack(
        children: [
          const Background(),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 240,
                            width: MediaQuery.of(context).size.width,
                            child: GetLists(),
                          ),
                          TextInput(
                              prefixIcon: Icons.add,
                              hintText: 'Entrez le nom de votre liste',
                              labelText: 'Nom de la liste',
                              validator: (value) {
                                _listTitle = value!;
                                if (value.isEmpty) {
                                  return 'La valeur ne peut pas être nulle';
                                } else {
                                  return null;
                                }
                              }),
                          MainButton(
                              label: 'Créer',
                              mainColor: false,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final currentUser =
                                      FirebaseAuth.instance.currentUser!;
                                  try {
                                    final userData = await FirebaseFirestore
                                        .instance
                                        .collection('users')
                                        .doc(currentUser.uid)
                                        .get();
                                    if (userData.exists) {
                                      if (userData.data() != null) {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(currentUser.uid)
                                            .collection('Lists')
                                            .doc(_listTitle)
                                            .set({'name': _listTitle});
                                      }
                                    }
                                  } catch (e) {
                                    print(e);
                                  }
                                }
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
