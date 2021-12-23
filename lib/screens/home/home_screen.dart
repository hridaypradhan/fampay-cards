import '../../global/constants/colors.dart';
import '../../global/widgets/logo_widget.dart';
import '../../providers/card_provider.dart';
import 'widgets/card_group_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  static const id = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    var cardProvider = Provider.of<CardProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SmartRefresher(
          onRefresh: () {
            cardProvider.refresh();
            _refreshController.refreshCompleted();
          },
          controller: _refreshController,
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

                      return cardProvider.loading
                          ? Column(
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(height: 20.0),
                                Text('Loading...'),
                              ],
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: cardProvider.errorFetchingData
                                  ? [
                                      const Padding(
                                        padding: EdgeInsets.all(20.0),
                                        child: Text(
                                          'Error fetching data.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ),
                                    ]
                                  : List.generate(
                                      cardProvider.visibleCardGroups.length,
                                      (index) => CardGroupWidget(
                                        cardGroup: cardProvider
                                            .visibleCardGroups[index],
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
