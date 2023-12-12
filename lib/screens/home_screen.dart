
import 'package:bookshelf/screens/planning_screen.dart';
import 'package:bookshelf/style/colors.dart';
import 'package:bookshelf/widgets/background.dart';
import 'package:bookshelf/widgets/catgeory_button.dart';
import 'package:bookshelf/widgets/books/recent_releases.dart';
import 'package:flutter/material.dart';
import '../style/spacings.dart';
import '../widgets/books/next_releases.dart';
import '../widgets/navigation/bottom_navigation.dart';
import 'all_books_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final livre1 = {
    'name': 'Un palais d épines et de roses',
    'url': 'https://sarahjmaas.com/wp-content/uploads/2022/02/ACOTAR_1h.jpg',
    'publication': '9 février 2017',
    'auteur': 'Sarah J. Maas',
  };
  final categories = [
    'fiction',
    'aventures',
    'fantasy',
    'policier',
    'Jeunesse',
    'Romance'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.white,
        leading: null,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            color: kSecondaryColor,
            tooltip: 'Go to notification page',
            onPressed: () {},
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
                children: [ //username
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Prochaine sorties'),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          color: kSecondaryColor,
                          onPressed: () {
                            Navigator.pushNamed(
                                context, PlanningScreen.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 240,
                    width: MediaQuery.of(context).size.width,
                    child: NextReleases(),
                  ),
                  const Text('Sorties récentes'),
              SizedBox(
                height: 240,
                width: MediaQuery.of(context).size.width,
                child: RecentReleases(),
              ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Catégories'),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_rounded),
                          color: kSecondaryColor,
                          onPressed: () {
                            Navigator.pushNamed(context, AllBooksScreen.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 7.0,
                    spacing: 7.0,
                    children: [
                      for (int i = 0; i < categories.length; i++)
                        CategoryButton(label: categories[i], onTap: () {})
                    ],
                  ),
                  const SizedBox(height: kVerticalPaddingL)
                ],
              ),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
