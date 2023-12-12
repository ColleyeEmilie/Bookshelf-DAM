import 'package:bookshelf/screens/all_books_screen.dart';
import 'package:bookshelf/screens/book_detail_screen.dart';
import 'package:bookshelf/screens/login_screen.dart';
import 'package:bookshelf/screens/new_list_screen.dart';
import 'package:bookshelf/screens/planning_screen.dart';
import 'package:bookshelf/screens/profil_screen.dart';
import 'package:bookshelf/screens/scan_screen.dart';
import 'screens/register_screen.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/books_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => const WelcomeScreen(),
  HomeScreen.routeName: (context) =>  const HomeScreen(),
  RegisterScreen.routeName: (context) =>  RegisterScreen(),
  LoginScreen.routeName: (context) =>  LoginScreen(),
  BooksScreen.routeName: (context) =>  BooksScreen(),
  ScanScreen.routeName: (context) =>  ScanScreen(),
  PlanningScreen.routeName: (context) =>  const PlanningScreen(),
  NewListScreen.routeName:(context)=>  NewListScreen(),
  ProfilScreen.routeName: (context) =>  const ProfilScreen(),
  AllBooksScreen.routeName: (context) =>  const AllBooksScreen(),
  BookDetailScreen.routeName: (context) {
    final Map<String, dynamic>? arguments = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
    if(arguments != null){
      return BookDetailScreen(
        name: arguments['name'] ?? '',
        imagePath: arguments['imagePath'] ?? '',
        description: arguments['description'] ?? '',
        author: arguments['author'] ?? '',
        publication: arguments['publication'] ?? '',
      );
    }
    return const Placeholder();
  },
};

