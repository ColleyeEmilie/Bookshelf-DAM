import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetLists extends StatelessWidget {
  const GetLists({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;
    final listsCollection = FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Lists');

    return StreamBuilder<QuerySnapshot>(
      stream: listsCollection.snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          final querySnapshot = snapshot.data!;
          //final List<String> listData = [];
          final List<String> listIds = [];

          querySnapshot.docs.forEach((doc) {
            //Object? data = doc.data();
            String id = doc.id;
            //listData.add(data.toString());
            listIds.add(id);
          });

          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: listIds.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(listIds[index]),
                    //Text(listData[index]),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}