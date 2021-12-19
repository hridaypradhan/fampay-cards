import 'package:fampay_cards/providers/card_provider.dart';
import 'package:fampay_cards/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => ChangeNotifierProvider(
              create: (context) => CardProvider(),
              child: const HomeScreen(),
            ),
      },
    );
  }
}
