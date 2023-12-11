import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/book.dart' as dto_book;
import 'package:flutter/material.dart';
import '../../screens/book_detail_screen.dart';
import '../../style/spacings.dart';
import 'package:dto/book.dart';

class RecentReleases extends StatefulWidget {
  RecentReleases({super.key});

  @override
  State<RecentReleases> createState() => _RecentReleasesState();
}

class _RecentReleasesState extends State<RecentReleases> {
  late final Stream<QuerySnapshot<dto_book.Book>>? _bookStream;

  @override
  void initState() {
    super.initState();
    _bookStream = getBookStream();
  }

  Stream<QuerySnapshot<Book>>? getBookStream() {
    return FirebaseFirestore.instance
        .collection('books')
        .withConverter<Book>(
          fromFirestore: (snapshot, _) => Book.fromJson(snapshot.data()!),
          toFirestore: (book, _) => book.toJson(),
        )
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Book>>(
      stream: _bookStream,
      builder:
          (BuildContext context, AsyncSnapshot<QuerySnapshot<Book>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        } else {
          final List<Book> books = snapshot.data!.docs.map((doc) => doc.data()).toList();
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: books.take(10).length,
            itemBuilder: (context, index) {
              final book = books[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, BookDetailScreen.routeName,
                        arguments: {
                          'name': book.name,
                          'description': book.description,
                          'author': book.author,
                          'imagePath': book.image,
                          'publication': book.publicationDate,
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kHorizontalPaddingS,
                        vertical: kVerticalPaddingS / 4),
                    child: Column(
                      children: [
                        SizedBox(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              book.image,
                              width: 110.0,
                              height: 170.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          book.name.length > 13
                              ? '${book.name.substring(0, 13)}...'
                              : book.name,
                        ),
                        Text(book.author),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
