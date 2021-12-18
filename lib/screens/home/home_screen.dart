import 'dart:convert';

import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/logo_widget.dart';
import 'package:fampay_cards/models/card_group.dart';
import 'package:fampay_cards/screens/home/widgets/card_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(30),
                child: LogoWidget(),
              ),
              Container(
                width: double.maxFinite,
                child: StreamBuilder<Response>(
                  stream: getData().asStream(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      Map<String, dynamic> data =
                          jsonDecode(snapshot.data!.body);
                      return Column(
                        children: List.generate(
                          data['card_groups'].length,
                          (index) => CardGroupWidget(
                            cardGroup: CardGroup.fromMap(data['card_groups'][index]),
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
                decoration: const BoxDecoration(
                  color: homeBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Response> getData() async => get(
        Uri.parse(
            'https://run.mocky.io/v3/fefcfbeb-5c12-4722-94ad-b8f92caad1ad'),
      );
}
