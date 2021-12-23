import 'dart:convert';

import '../models/contextual_card.dart';
import '../models/card_group.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CardProvider extends ChangeNotifier {
  // List of all the cards and list of all cards to display
  List<CardGroup> _cardGroups = [], _visibleCardGroups = [];

  /* 
     Whether data has been fetched from the API or not
     This only needs to happen once, since the pull-to-refresh functionality changes what is visible
  */
  bool _gotInitialData = false;

  bool _errorFetchingData = false, _loading = true;

  final String _url =
      'https://run.mocky.io/v3/fefcfbeb-5c12-4722-94ad-b8f92caad1ad';

  // Method to fetch data from the API
  Future<void> getData() async {
    var response = await get(
      Uri.parse(_url),
    );

    if (response.body.isEmpty) {
      _errorFetchingData = true;
      _setLoading(false);
      notifyListeners();

      return;
    }

    Map<String, dynamic> cardGroupData = jsonDecode(response.body);

    _cardGroups = List.generate(
      cardGroupData['card_groups'].length,
      (index) => CardGroup.fromMap(
        cardGroupData['card_groups'][index],
      ),
    );

    _visibleCardGroups = List.generate(
      cardGroupData['card_groups'].length,
      (index) => CardGroup.fromMap(
        cardGroupData['card_groups'][index],
      ),
    );

    _gotInitialData = true;
    _setLoading(false);

    notifyListeners();
  }

  // When 'remind me' is pressed, remove the card from visible cards
  temporarilyRemove(FampayCard toHide) {
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

  // When 'dismiss now' is pressed, remove the card from list of cards and refresh
  permanentlyRemove(FampayCard toDelete) {
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

  // Make visible cards reflect any changes in the overall list of cards
  refresh() {
    _visibleCardGroups.clear();
    _visibleCardGroups = List.of(_cardGroups);
    notifyListeners();
  }

  _setLoading(bool toSet) {
    _loading = toSet;
    notifyListeners();
  }

  // Getter methods for all private variables that are in use elsewhere
  List<CardGroup> get visibleCardGroups => _visibleCardGroups;
  List<CardGroup> get cardGroups => _cardGroups;
  bool get gotInitialData => _gotInitialData;
  bool get errorFetchingData => _errorFetchingData;
  bool get loading => _loading;
}
