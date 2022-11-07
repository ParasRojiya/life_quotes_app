import 'package:flutter/material.dart';
import 'package:life_quotes/screens/category_or_author_page.dart';
import 'package:life_quotes/screens/details_page.dart';
import 'package:life_quotes/screens/homepage.dart';
import 'package:life_quotes/screens/quotes_page.dart';
import 'package:life_quotes/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      routes: {
        'splash_screen': (context) => const SplashScreen(),
        '/': (context) => const HomePage(),
        'details_page': (context) => const DetailsPage(),
        'category_or_author_page': (context) => const CategoryOrAuthorPage(),
        'quotes_page': (context) => const QuotesPage(),
      },
    ),
  );
}
