import 'package:fampay_cards/global/constants/colors.dart';
import 'package:fampay_cards/global/widgets/logo_widget.dart';
import 'package:fampay_cards/providers/card_provider.dart';
import 'package:fampay_cards/screens/home/widgets/card_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home_screen';
  static const url =
      'https://run.mocky.io/v3/fefcfbeb-5c12-4722-94ad-b8f92caad1ad';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          onRefresh: () {
            cardProvider.refresh();
            refreshController.refreshCompleted();
          },
          controller: refreshController,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: LogoWidget(),
                ),
                Container(
                  width: double.maxFinite,
                  child: Builder(
                    builder: (context) {
                      if (!cardProvider.gotInitialData) {
                        cardProvider.getData();
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: List.generate(
                          cardProvider.visibleCardGroups.length,
                          (index) => CardGroupWidget(
                            cardGroup: cardProvider.visibleCardGroups[index],
                          ),
                        ),
                      );
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
      ),
    );
  }
}
