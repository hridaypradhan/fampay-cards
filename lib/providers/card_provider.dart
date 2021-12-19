import 'package:fampay_cards/models/card_group.dart';
import 'package:fampay_cards/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardProvider extends ChangeNotifier {
  List<CardGroup> _cardGroups = [], _visibleCardGroups = [];

  Future<Response> getData() async {
    return get(
      Uri.parse(HomeScreen.url),
    );
  }

  List<CardGroup> get visibleCardGroups => _visibleCardGroups;
  setCardGroups() {}
}
