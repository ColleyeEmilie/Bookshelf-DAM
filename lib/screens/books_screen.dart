import 'package:bookshelf/style/spacings.dart';
import 'package:bookshelf/widgets/form/text_input.dart';
import 'package:bookshelf/widgets/main_button.dart';
import 'package:bookshelf/widgets/listes/test_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bookshelf/style/colors.dart';
import '../widgets/background.dart';
import '../widgets/navigation/bottom_navigation.dart';
import 'new_list_screen.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const String routeName = '/books';
  String _bookTitle = '';


  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final listsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Lists');

    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: null,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            color: kSecondaryColor,
            tooltip: 'add a book',
            onPressed: () {
              Navigator.pushNamed(context, NewListScreen.routeName);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: kVerticalPaddingXL,),
                        TestList(listsCollection: listsCollection)
                      ],
                    ),
                  )
              )
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
