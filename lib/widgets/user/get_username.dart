import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetUsername extends StatefulWidget {
  const GetUsername({super.key});

  @override
  _GetUsernameState createState() => _GetUsernameState();
}

class _GetUsernameState extends State<GetUsername> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _fetchUsername();
  }

  Future<String> fetchUsername() async {
    final currentUser = FirebaseAuth.instance.currentUser!;
    try {
      final userData = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      if (userData.exists) {
        if (userData.data() != null && userData.data()!.containsKey('username')) {
          return userData.data()!['username'];
        } else {
          return '';
        }
      } else {
        return '';
      }
    } catch (e) {
      print(e);
      return '';
    }
  }

  void _fetchUsername() async {
    String fetchedUsername = await fetchUsername();
    setState(() {
      username = fetchedUsername;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(username),
      ],
    );
  }
}