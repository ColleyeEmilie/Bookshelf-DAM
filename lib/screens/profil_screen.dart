import 'package:bookshelf/widgets/background.dart';
import 'package:bookshelf/widgets/form/logout.dart';
import 'package:bookshelf/widgets/user/get_username.dart';
import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/spacings.dart';
import '../widgets/navigation/bottom_navigation.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  static const String routeName = '/profil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.build),
            color: kSecondaryColor,
            tooltip: 'Go to notification page',
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: [
          const Background(),
          SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  children: [
                    const SizedBox(height: kVerticalPaddingL),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: const Image(
                            image: AssetImage(
                              'assets/img/profilepicture.png',
                            ),
                          )),
                    ),
                    const SizedBox(height: kVerticalPaddingS),
                    const GetUsername(),
                    const Logout(),
                  ]),
            ),
          ),
        ),
        ]
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
