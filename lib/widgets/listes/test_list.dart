import 'package:bookshelf/style/spacings.dart';
import 'package:bookshelf/widgets/listes/get_lists.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TestList extends StatelessWidget {
  final CollectionReference listsCollection;

  TestList({required this.listsCollection});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: _isListEmpty(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          bool isEmpty = snapshot.data ?? true;

          if (isEmpty) {
            return const Text("Tu n'as pas encore de liste !\n Crées-en une ! ");
          } else {
            return const Column(
              children: [
                Text("Ma bibliothèque"),
                SizedBox(height: kVerticalPaddingL),
                GetLists(),
              ],
            );
          }
        }
      },
    );
  }

  Stream<bool> _isListEmpty() async* {
    final querySnapshot = await listsCollection.get();
    yield querySnapshot.docs.isEmpty;
  }
}