import 'dart:convert';

import 'package:fampay_cards/models/contextual_card.dart';
import 'package:fampay_cards/models/card_group.dart';
import 'package:fampay_cards/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardProvider extends ChangeNotifier {
  List<CardGroup> _cardGroups = [], _visibleCardGroups = [];
  bool gotInitialData = false;

  getData() async {
    var response = await get(
      Uri.parse(HomeScreen.url),
    );

    Map<String, dynamic> data = jsonDecode(response.body);
    _cardGroups = List.generate(
      data['card_groups'].length,
      (index) => CardGroup.fromMap(
        data['card_groups'][index],
      ),
    );
    _visibleCardGroups = List.generate(
      data['card_groups'].length,
      (index) => CardGroup.fromMap(
        data['card_groups'][index],
      ),
    );
    gotInitialData = true;
    notifyListeners();
  }

  temporaryRemoval(FampayCard toHide) {
    for (int i = 0; i < _visibleCardGroups.length; i++) {
      for (int j = 0; j < _visibleCardGroups[i].cards.length; j++) {
        if (_visibleCardGroups[i].cards[j] == toHide) {
          _visibleCardGroups[i].cards.remove(toHide);
          notifyListeners();
          return;
        }
      }
    }
  }

  permanentRemoval(FampayCard toDelete) {
    for (int i = 0; i < _cardGroups.length; i++) {
      for (int j = 0; j < _cardGroups[i].cards.length; j++) {
        if (_cardGroups[i].cards[j] == toDelete) {
          _cardGroups[i].cards.remove(toDelete);
          refresh();
          notifyListeners();
          return;
        }
      }
    }
  }

  refresh() {
    _visibleCardGroups.clear();
    _visibleCardGroups = List.of(_cardGroups);
    notifyListeners();
  }

  List<CardGroup> get visibleCardGroups => _visibleCardGroups;
  List<CardGroup> get cardGroups => _cardGroups;
}
