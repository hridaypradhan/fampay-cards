import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/logo_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(30),
              child: LogoWidget(),
            ),
            Expanded(
              child: Container(
                width: double.maxFinite,
                child: Text('Hello'),
                decoration: const BoxDecoration(
                  color: homeBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
