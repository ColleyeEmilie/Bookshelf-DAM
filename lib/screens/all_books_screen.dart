import 'package:bookshelf/style/spacings.dart';
import 'package:bookshelf/widgets/books/all_books.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';
import '../widgets/background.dart';
import '../widgets/navigation/bottom_navigation.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  static const String routeName = '/allBooks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tous les livres',
            style: TextStyle(color: kSecondaryColor)),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            color: kSecondaryColor,
            tooltip: 'add a book',
            onPressed: () {

            },
          ),
        ],
      ),
      body: Stack(children: [
        const Background(),
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                          AllBooks(),
                          const SizedBox(height: kVerticalPaddingXL*2)
                        ]
                    )
                )
            )
        )
      ]),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
