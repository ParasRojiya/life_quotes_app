import 'dart:math';

import 'package:flutter/material.dart';
import 'package:life_quotes/helpers/api_helper.dart';
import 'package:life_quotes/helpers/db_helper.dart';
import 'package:life_quotes/modals/modal.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // randomQuotes = DBHelper.dbHelper.fetchRandomQuote(tableName: 'randomQuote');

    Future.delayed(
      const Duration(seconds: 5),
      () =>
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false),
    );
  }

  List<Color> colors = [
    Colors.blue,
    Colors.blueGrey,
    Colors.lightBlue,
    Colors.green,
    Colors.deepOrangeAccent,
    Colors.teal,
    Colors.red,
  ];

  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[random.nextInt(colors.length)],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(10),
        color: Colors.white.withOpacity(0.1),
        alignment: Alignment.center,
        child: FutureBuilder(
          future: DBHelper.dbHelper.fetchRandomQuote(
              tableName:
                  'randomQuote'), //QuotesAPIHelper.quotesAPIHelper.fetchRandomQuote(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              List<QuotesDB>? data = snapshot.data;
              return Text(
                " ${data?.first.quote} ",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
