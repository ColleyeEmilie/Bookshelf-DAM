import 'package:bookshelf/widgets/main_button.dart';
import 'package:flutter/material.dart';
import '../style/colors.dart';
import '../style/spacings.dart';
import '../widgets/navigation/bottom_navigation.dart';

class BookDetailScreen extends StatefulWidget {
  final String name;
  final String imagePath;
  final String description;
  final String author;
  final String publication;

  const BookDetailScreen({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
    required this.author,
    required this.publication,
  });

  static const String routeName = '/book';

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name,
            style: const TextStyle(color: kSecondaryColor)),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: kSecondaryColor, //change your color here
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: Column(
              children: [
                SizedBox(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.imagePath,
                      width: 110.0,
                      height: 170.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                )),
                const SizedBox(height: kVerticalPaddingS),
                Text(
                  widget.name,
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.author,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: kVerticalPaddingS),
                const Text(
                  'Date de sortie',
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.publication,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: kVerticalPaddingS),
                const Text(
                  'Résumé',
                  textAlign: TextAlign.left,
                ),
                Text(
                  widget.description,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: kVerticalPaddingL),
                MainButton(
                    label: 'Ajouter à ma bibliothèque ',
                    onTap: () {},
                    mainColor: false),
                const SizedBox(height: kVerticalPaddingS),
                MainButton(
                    label: 'Acheter ce livre', onTap: () {}, mainColor: false)
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
